FactoryBot.define do
  factory :transaction do
    association :user, strategy: :build
    association :origin_wallet, factory: :wallet, strategy: :build
    association :target_wallet, factory: :wallet, strategy: :build
    association :reference, strategy: :build

    operation { "income" }
    amount { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    point_amount { Faker::Number.between(from: 100, to: 1_000) }
  end
end
