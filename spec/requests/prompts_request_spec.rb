# frozen_string_literal: true

require 'rails_helper'

describe 'Prompts' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/prompts/'
      expect(response).to have_http_status(:ok)
    end
  end
end
