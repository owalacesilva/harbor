FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }

    trait :with_sponsored do
      transient do
        sponsored_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:user, evaluator.sponsored_count, sponsor: user)

        user.reload
      end
    end
  end
end
