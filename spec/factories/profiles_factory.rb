FactoryBot.define do
  factory :profile do
    first_name { Faker::String }
    last_name { Faker::String }
    gender { "undefined" }
    birth_date { Date.current }
  end
end
