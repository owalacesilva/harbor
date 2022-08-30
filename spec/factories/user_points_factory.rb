FactoryBot.define do
  factory :user_point do
    user { association :user }
    reference { association :reference }

    amount { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
  end
end
