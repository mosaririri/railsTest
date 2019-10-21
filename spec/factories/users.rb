# frozen_string_literal: true.
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { |n| "TEST_PASS#{n}"}
  end
  factory :invalid_user, class: User do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:password) { |n| "TEST_PASS#{n}"}
  end
end
