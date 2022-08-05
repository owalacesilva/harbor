FactoryBot.define do
  factory :reference do
    sequence(:unique_name) { |n| "REF#{n}" }
    display_name { Faker::Nation.nationality }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    unit_price { Faker::Commerce.price(range: 1.0..1000.0, as_string: false) }
  end
end
