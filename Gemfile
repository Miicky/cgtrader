# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'elasticsearch-model', '7.2.1'

# HTTP client
gem 'faraday', '2.8.1'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '7.1.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails', '3.4.2'

# Use postgresql as the database for Active Record
gem 'pg', '1.5.4'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '6.4.1'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails', '2.0.1'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
# gem "turbo-rails", "1.5.0"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
# gem "stimulus-rails", "1.3.3"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder", "2.11.5"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.17.0', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development do
  gem 'rubocop', '1.59.0'
  gem 'rubocop-performance', '1.20.1'
  gem 'rubocop-rails', '2.23.1'
  gem 'rubocop-rspec', '2.26.0'
end

group :development, :test do
  # Shell and debug
  gem 'pry', '0.14.2'
  gem 'rspec-rails', '6.1.0'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara', '3.39.2'
  gem 'database_cleaner-active_record', '2.1.0'
  # Generate fake data for tests
  gem 'faker', '3.2.2'
  gem 'selenium-webdriver', '4.16.0'
  # Code coverage tracking gem
  gem 'simplecov', '0.22.0'
  # Stub HTTP requests for testing
  gem 'webmock', '3.19.1'
end
