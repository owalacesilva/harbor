FactoryBot.define do
  factory :purchase do
    user { association :user, strategy: :build }

    sequence(:code) { |n| "PURC#{n}" }
    amount { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
  end
end
