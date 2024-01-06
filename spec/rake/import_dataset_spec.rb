# frozen_string_literal: true

require 'rails_helper'

Rails.application.load_tasks

describe 'Import dataset' do
  let(:prompts_count) { 180 }
  let(:dataset_stub) { DatasetStub.new(prompts_count) }

  before do
    # TODO: make stun dynamic by offset and length
    dataset_stub.dataset
    dataset_stub.dataset(offset: 100)
    Rake::Task['dataset:import'].invoke
  end

  it 'successfully create two prompts' do
    expect(Prompt.count).to eq 180
  end
end
