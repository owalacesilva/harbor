FactoryBot.define do
  factory :notification do
    user { association :user }

    broadcast { false }
    opened { false }
    title { Faker::Nation.nationality }
    message { Faker::Lorem.paragraph(sentence_count: 3) }
    url { Faker::Nation.nationality }

    trait :with_broadcast do
      broadcast { true }
    end

    trait :with_opened do
      opened { true }
    end
  end
end
