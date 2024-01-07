# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'prompts/index' do
  it 'renders am index page' do
    render
    expect(rendered).to match(/Prompts#index/)
  end
end
