# frozen_string_literal: true

require 'rails_helper'

Rails.application.load_tasks

describe 'Import dataset' do
  it 'not raised error' do
    expect { Rake::Task['dataset:import'].invoke }.not_to raise_error
  end

  describe 'Creates Prompts' do
    before { Rake::Task['dataset:import'].invoke }

    it 'successfully create two prompts' do
      expect(Prompt.count).to eq 2
    end
  end
end
