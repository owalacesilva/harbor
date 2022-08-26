FactoryBot.define do
  factory :profile do
    user { association :user }

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { "undefined" }
    birth_date { Faker::Date.backward(days: 10950) } # 30 years
    phone_number { Faker::PhoneNumber.cell_phone }
  end
end
