# frozen_string_literal: true

# Elastic search extention for Prompt model
module Searchable
  extend ActiveSupport::Concern
  include ReplacementPatterns

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
            filter: ['lowercase'],
            char_filter: %w[digit_k_capture three_d_capture]
          }
        },
        char_filter: { digit_k_capture:, three_d_capture: }
      }
    } do
      mappings dynamic: 'false' do
        indexes :text, analyzer: 'text_analyzer'
      end
    end
  end
end
