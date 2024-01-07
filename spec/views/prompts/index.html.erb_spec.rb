# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'prompts/index' do
  let!(:prompts) { create_list(:prompt, 2) }

  before do
    assign(:prompts, prompts)
    render
  end

  it 'renders an index page' do
    expect(rendered).to match(/Prompts#index/)
  end

  it 'render two prompts' do
    prompts.each do |prompt|
      assert_select 'tr>td', text: prompt.text, count: 1
    end
  end
end
