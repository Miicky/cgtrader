# frozen_string_literal: true

namespace :dataset do
  desc 'Importing dataset from huggingface.co'
  task import: :environment do
    Rails.logger.info('Starting dataset:import')
    start_time = Time.current

    end_time = Time.current
    Rails.logger.info("End of dataset:import, duration: #{end_time - start_time}")
  end
end
