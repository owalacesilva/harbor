FactoryBot.define do
  factory :qualification do

    sequence(:unique_name) { |n| "QLF#{n}" }
    display_name { Faker::Nation.nationality }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
  end
end
