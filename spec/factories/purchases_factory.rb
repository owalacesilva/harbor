FactoryBot.define do
  factory :purchase do
    user { association :user }
    reference { association :reference }

    sequence(:code) { |n| "PURC#{n}" }
    status { Purchase.statuses.keys.sample }
    amount { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    total { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }

    trait :pending do
      status { 'pending' }
    end
  end
end
