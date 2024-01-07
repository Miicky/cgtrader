# frozen_string_literal: true

require 'rails_helper'

describe Prompt, :elasticsearch do
  describe 'vaildation' do
    it 'can be created' do
      prompt = described_class.new
      expect(prompt).to be_valid
    end
  end

  describe '#seach' do
    before do
      prompts.each { |text| described_class.create(text:) }
      described_class.__elasticsearch__.refresh_index!
    end

    describe 'simple search' do
      let(:prompt_first) { 'My first prompt' }
      let(:prompt_second) { 'My prompt searchable' }
      let(:prompt_third) { 'My prompt searchable big text first' }
      let(:prompt_fourth) { 'First rails' }
      let(:prompt_fifth) { 'Unknown text' }
      let(:prompts) { [prompt_first, prompt_second, prompt_third, prompt_fourth, prompt_fifth] }
      let(:search) { 'first prompt' }

      # TODO: split expectations into different examples
      it 'returns expected prompts' do
        expect(described_class.search(search).count).to eq(4)
        expect(described_class.search(search).first.text).to eq(prompt_first)
        expect(described_class.search(search)[1].text).to eq(prompt_third)
      end
    end

    describe 'digit_k_analyzer' do
      let(:prompt_first) { ',My1 4 k' }
      let(:prompt_second) { 'My2 4k' }
      let(:prompt_third) { 'My3 4    k' }
      let(:prompt_fourth) { 'My4 k4' }
      let(:prompt_fifth) { 'Unknown, , text' }
      let(:prompts) { [prompt_first, prompt_second, prompt_third, prompt_fourth, prompt_fifth] }
      let(:search) { '4k' }

      # TODO: split expectations into different examples
      it 'returns expected prompts' do
        expect(described_class.search(search).count).to eq(3)
        expect(described_class.search(search).first.text).to eq(prompt_first)
        expect(described_class.search(search)[1].text).to eq(prompt_second)
      end
    end

    describe 'three_d_analyzer' do
      let(:prompt_first) { 'text 3d' }
      let(:prompt_second) { 'text2 3 d' }
      let(:prompt_third) { 'Unknown text' }
      let(:prompts) { [prompt_first, prompt_second, prompt_third] }
      let(:search) { '3d' }

      # TODO: split expectations into different examples
      it 'returns expected prompts' do
        expect(described_class.search(search).count).to eq(2)
        expect(described_class.search(search).map(&:text)).not_to eq(prompt_third)
      end
    end
  end
end
