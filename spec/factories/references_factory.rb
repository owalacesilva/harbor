FactoryBot.define do
  factory :reference do
    sequence(:unique_name) { |n| "REF#{n}" }
    display_name { Faker::Nation.nationality }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
  end
end
