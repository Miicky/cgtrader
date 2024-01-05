# frozen_string_literal: true

require 'rails_helper'

describe Prompt do
  it 'can be created' do
    prompt = described_class.new
    expect(prompt).to be_valid
  end
end
