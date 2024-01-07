# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'prompts/index' do
  it 'renders an index page' do
    render
    expect(rendered).to match(/Prompts#index/)
  end

  describe 'renders all prompts' do
    let(:prompts) { create_list(:prompt, 2) }

    it 'render two prompts' do
      render
      prompts.each do |prompt|
        assert_select 'tr>td', text: prompt.text, count: 1
      end
    end
  end
end
