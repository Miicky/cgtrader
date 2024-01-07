# frozen_string_literal: true

require 'rails_helper'

describe 'Prompts' do
  describe 'GET /index' do
    it 'returns http success' do
      get prompts_path
      expect(response).to have_http_status(:ok)
    end

    describe '#search' do
      let!(:prompt_searchable) { create(:prompt, text: 'first_text') }
      let!(:prompt_not_searchable) { create(:prompt, text: 'unknown') }

      before do
        Prompt.__elasticsearch__.refresh_index!
        get prompts_path, params: { search: prompt_searchable.text }
      end

      it 'shows searchable prompt' do
        expect(response.body).to include(prompt_searchable.text)
      end

      it "doesn't show not_searchable prompt" do
        expect(response.body).not_to include(prompt_not_searchable.text)
      end
    end
  end
end
