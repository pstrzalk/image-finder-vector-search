# Image Finder - Vector Search in Ruby on Rails

A demo of image recognition and Vector Search using OpenAI and Ruby on Rails. It allows you to find uploaded images by their descriptions.

For more information, check the Ruby & AI series of articles at https://www.visuality.pl/posts/llm-embeddings-in-ruby and my presentation on embeddings, Vector Search and RAG in Ruby at https://www.youtube.com/watch?v=KxGZv7Z4BQs

## How to use it

- run the server
- go to the root path
- add images. With each image:
  - file is stored as ActiveStorage
  - image is described (image-to-text) using OpenAI API
  - image's description is embedded using OpenAI API
  - both: description and embedding are saved with image
- go to the root path and enter a search query

The search mechanism uses embeddings and Vector Search, so you don't have to look for exact phrases, but for semantic similarities.

## Installation

You have to have pgvector installed locally (and PostgreSQL of course). To fully understand how it all works, check out the article at [TO_BE_ADDED](Visuality Blog Pages)

Make sure you have OPENAI_API_KEY environment variable available, as well as some available credits.

Apart from it, just `rails db:create` and `rails db:migrate` should be enough
