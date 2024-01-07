# frozen_string_literal: true

# Elastic search extention for Prompt model
module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    def as_indexed_json(_options = {})
      as_json(only: [:text])
    end

    # Elasticsearch settings and mappings
    settings index: {
      analysis: {
        analyzer: {
          digit_k_analyzer: {
            type: 'custom',
            tokenizer: 'standard',
            filter: ['lowercase'],
            char_filter: ['digit_k_capture']
          }
        },
        char_filter: {
          digit_k_capture: {
            type: 'pattern_replace',
            pattern: '(\\d)\\s+k',
            replacement: '$1k'
          }
        }
      }
    } do
      mappings dynamic: 'false' do
        indexes :text, analyzer: 'digit_k_analyzer'
      end
    end
  end
end
