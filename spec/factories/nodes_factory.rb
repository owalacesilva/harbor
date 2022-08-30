FactoryBot.define do
  factory :node do
    user { association :user }

    lft { 1 }
    rgt { 2 }
    depth { 1 }
    points { Faker::Number.number(digits: 3) }
  end
end
