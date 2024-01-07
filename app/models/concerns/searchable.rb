# frozen_string_literal: true

# Elastic search extention for Prompt model
module Searchable
  extend ActiveSupport::Concern
  include ReplacementPatterns
  include FilterSynonym

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    # Elasticsearch settings and mappings
    settings index: {
      analysis: {
        analyzer: {
          text_analyzer: {
            type: 'custom',
            tokenizer: 'standard',
            filter: %w[lowercase synonym_filter],
            char_filter: %w[digit_k_capture three_d_capture]
          }
        },
        char_filter: { digit_k_capture:, three_d_capture: },
        filter: { synonym_filter: }
      }
    } do
      mappings dynamic: 'false' do
        indexes :text, analyzer: 'text_analyzer'
      end
    end
  end
end
