FactoryBot.define do
  factory :transaction do
    user { association :user, strategy: :build }
    reference { association :reference, strategy: :build }
    origin_wallet { association :wallet, strategy: :build }
    target_wallet { association :wallet, strategy: :build }

    sequence(:code) { |n| "COD#{n}" }
    operation { "income" }
    amount { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    point_amount { Faker::Number.between(from: 100, to: 1_000) }
  end
end
