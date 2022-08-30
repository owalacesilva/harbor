FactoryBot.define do
  factory :user_point_record do
    user { association :user }
    origin_user { association :user }
    reference { association :reference }

    record_date { Date.current }
    base_value { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
    amount { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
  end
end
