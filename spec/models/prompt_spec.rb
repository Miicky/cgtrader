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

      it 'returns four results' do
        expect(described_class.search(search).count).to eq(4)
      end

      it 'returns filtered results' do
        expect(described_class.search(search).map(&:text)).to contain_exactly(
          prompt_first, prompt_second, prompt_third, prompt_fourth
        )
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

      it 'returns three results' do
        expect(described_class.search(search).count).to eq(3)
      end

      it 'returns filtered results' do
        expect(described_class.search(search).map(&:text)).to contain_exactly(prompt_first, prompt_second, prompt_third)
      end
    end

    describe 'three_d_analyzer' do
      let(:prompt_first) { 'text 3d' }
      let(:prompt_second) { 'text2 3 d' }
      let(:prompt_third) { 'Unknown text' }
      let(:prompts) { [prompt_first, prompt_second, prompt_third] }
      let(:search) { '3d' }

      it 'returns two results' do
        expect(described_class.search(search).count).to eq(2)
      end

      it 'returns results withot not matching prompt' do
        expect(described_class.search(search).map(&:text)).not_to eq(prompt_third)
      end
    end

    describe 'synonim_filtering' do
      let(:prompt_first) { 'ttext 4k' }
      let(:prompt_second) { 'text2 UHD' }
      let(:prompt_third) { 'text3 highly detailed' }
      let(:prompt_fourth) { 'Unknown text' }
      let(:prompts) { [prompt_first, prompt_second, prompt_third, prompt_fourth] }
      let(:search) { '4k' }

      it 'returns two results' do
        expect(described_class.search(search).count).to eq(3)
      end

      it 'returns filtered results' do
        expect(described_class.search(search).map(&:text)).to contain_exactly(prompt_first, prompt_second, prompt_third)
      end
    end
  end
end
