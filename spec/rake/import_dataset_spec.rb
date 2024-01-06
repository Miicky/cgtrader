# frozen_string_literal: true

require 'rails_helper'

Rails.application.load_tasks

describe 'Import dataset' do
  it 'not raised error' do
    expect { Rake::Task['dataset:import'].invoke }.not_to raise_error
  end
end
