class Image < ApplicationRecord
  has_one_attached :file

  has_neighbors :embedding
  after_create_commit :recalculate_embedding

  def recalculate_embedding
    return unless file.attachment.present?

    client = OpenAI::Client.new(access_token: Rails.configuration.x.openai_api_key)

    base64_encoded_image = Base64.strict_encode64(file.download)

    messages = [
      { "type": "text", "text": "What’s in this image?" },
      { "type": "image_url",
        "image_url": {
          "url": "data:image/png;base64,#{base64_encoded_image}"
        }
      }
    ]

    response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [ { role: "user", content: messages } ]
      }
    )

    self.description = response.dig("choices", 0, "message", "content")

    response = client.embeddings(
      parameters: {
        model: "text-embedding-3-large",
        input: description
      }
    )
    self.embedding = response.dig("data", 0, "embedding")
    self.save
  end
end
