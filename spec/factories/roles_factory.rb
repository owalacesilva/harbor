FactoryBot.define do
  factory :role do
    sequence(:unique_name) { |n| "ROL#{n}" }
    display_name { Faker::Nation.nationality }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
  end
end
