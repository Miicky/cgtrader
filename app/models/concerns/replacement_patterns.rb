# frozen_string_literal: true

# Elastic search extention for Prompt model
module ReplacementPatterns
  extend ActiveSupport::Concern

  class_methods do
    def digit_k_capture
      {
        type: 'pattern_replace',
        pattern: '(\\d)\\s+k',
        replacement: '$1k'
      }
    end

    def three_d_capture
      {
        type: 'pattern_replace',
        pattern: '(3)\\s+d',
        replacement: '$1d'
      }
    end
  end
end
