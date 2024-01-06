# frozen_string_literal: true

require 'rails_helper'

describe Prompt do
  it 'can be created' do
    prompt = described_class.new
    expect(prompt).to be_valid
  end

  describe '#seach' do
    let(:prompt_first) { 'My first prompt' }
    let(:prompt_second) { 'My prompt searchable' }
    let(:prompt_third) { 'My prompt searchable big text first' }
    let(:prompt_fourth) { 'First rails' }
    let(:prompt_fifth) { 'Unknown text' }
    let(:prompts) { [prompt_first, prompt_second, prompt_third, prompt_fourth, prompt_fifth] }
    let(:search) { 'first prompt' }

    # TODO: split expectations into different examples
    it 'Returns expected prompts' do
      prompts.each { |text| described_class.create(text:) }
      expect(described_class.search(search).count).to eq(4)
      expect(described_class.search(search).first.text).to eq(prompt_first)
      expect(described_class.search(search)[1].text).to eq(prompt_third)
    end
  end
end
