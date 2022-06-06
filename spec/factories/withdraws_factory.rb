FactoryBot.define do
  factory :withdraw do
    association :user, factory: :user, strategy: :build
    association :wallet, factory: :wallet, strategy: :build

    balance { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
  end
end
