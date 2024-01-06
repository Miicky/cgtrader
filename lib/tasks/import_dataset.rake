# frozen_string_literal: true

namespace :dataset do
  desc 'Importing dataset from huggingface.co'
  task import: :environment do
    Rails.logger.info('Starting dataset:import')
    start_time = Time.current

    dataset_url = 'https://datasets-server.huggingface.co/rows'
    dataset_name = 'Gustavosta/Stable-Diffusion-Prompts'
    dataset_config = 'default'
    dataset_split = 'train'
    offset = 0
    length = 100

    loop do
      response = Faraday.get(dataset_url,
                             { dataset: dataset_name, config: dataset_config, split: dataset_split, offset:, length: })
      return unless response.success? # TODO: Add logic for unsuccess request

      parsed_response = JSON.parse(response.body).deep_symbolize_keys

      parsed_response[:rows].map do |hash|
        Prompt.create(row_idx: hash[:row_idx], text: hash.dig(:row, :Prompt))
      end
      total_rows = parsed_response[:num_rows_total].to_i
      Rails.logger.info("Progress #{((offset.to_f / total_rows) * 100).round(2)} %")
      offset += length
      break if total_rows <= offset
    end

    # TODO: Possible improvement collect all data and import it once in batches

    end_time = Time.current
    Rails.logger.info("End of dataset:import, duration: #{end_time - start_time}")
  end
end
