FactoryBot.define do
  factory :user do
    association :profile

    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
  end
end
