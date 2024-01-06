# frozen_string_literal: true

namespace :elastic do
  desc 'Creating index'
  task setupdb: :environment do
    Prompt.__elasticsearch__.create_index!
  end
end
