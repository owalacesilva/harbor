FactoryBot.define do
  factory :account do
    association :role
    association :profile

    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
  end
end
