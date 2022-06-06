FactoryBot.define do
  factory :reference do
    unique_name { Faker::String }
    display_name { Faker::String }
    description { Faker::String }
  end
end
