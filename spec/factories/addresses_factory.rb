FactoryBot.define do
  factory :address do
    association :user

    postal_code { Faker::Address.postcode }
    street_address { Faker::Address.street_name }
    building_number { Faker::Address.building_number }
    recipient { Faker::Address.building_number }
    apartament { Faker::Address.building_number }
    door_code { Faker::Address.building_number }
    floor { Faker::Address.building_number }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state }
    state_abbr { Faker::Address.state_abbr }
    country { Faker::Address.country }
    country_code { Faker::Address.country_code }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
