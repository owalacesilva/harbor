FactoryBot.define do
  factory :point_distribution do
    user { association :user }
    reference { association :reference }
    purchase { association :purchase }
    user_point_record { association :user_point_record }

    done { false }
    base_value { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }

    trait :with_done do
      done { true }
      done_at { Time.current }
    end
  end
end
