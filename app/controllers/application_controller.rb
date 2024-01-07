# frozen_string_literal: true

# Main controller class
class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV.fetch('USER'), password: ENV.fetch('PASSWORD') if Rails.env.production?
end
