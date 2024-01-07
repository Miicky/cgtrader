# frozen_string_literal: true

# Elastic search extention for Prompt model
module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    # Elasticsearch settings and mappings
    settings index: {
      analysis: {
        analyzer: {
          digit_k_analyzer: {
            type: 'custom',
            tokenizer: 'standard',
            filter: ['lowercase'],
            char_filter: %w[digit_k_capture digit_d_capture]
          }
        },
        char_filter: {
          digit_k_capture: {
            type: 'pattern_replace',
            pattern: '(\\d)\\s+k',
            replacement: '$1k'
          },
          digit_d_capture: {
            type: 'pattern_replace',
            pattern: '(3)\\s+d',
            replacement: '$1d'
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
