class AddEmbeddingToImages < ActiveRecord::Migration[8.0]
  def change
    add_column :images, :embedding, :vector, limit: 3072
  end
end
