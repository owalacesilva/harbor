FactoryBot.define do
  factory :role do
    unique_name { Faker::String }
    display_name { Faker::String }
    description { Faker::String }
  end
end
