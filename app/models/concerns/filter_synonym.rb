# frozen_string_literal: true

# Elastic search extention for Prompt model
module FilterSynonym
  SYNONYMS = ['4k, 8k, ulhighly detailed, ultra resolution, 4k UHD'].freeze
  extend ActiveSupport::Concern

  class_methods do
    def synonym_filter
      {
        type: 'synonym',
        synonyms: SYNONYMS
      }
    end
  end
end
