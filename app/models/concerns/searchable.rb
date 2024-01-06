# frozen_string_literal: true

# Elastic search extention for Prompt model
module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :text, type: :text
    end
  end
end
