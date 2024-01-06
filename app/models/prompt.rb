# frozen_string_literal: true

# Mapping prompts data
class Prompt < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
