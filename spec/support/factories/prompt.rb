# frozen_string_literal: true

FactoryBot.define do
  factory :prompt do
    text { Faker::Lorem.paragraph }
  end
end
