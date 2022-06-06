FactoryBot.define do
  factory :wallet do
    association :user, factory: :user, strategy: :build

    balance { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    incomes { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    expenses { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
  end
end
