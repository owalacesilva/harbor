FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { "undefined" }
    birth_date { Date.current }
  end
end
