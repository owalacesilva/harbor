FactoryBot.define do
  factory :user_graduation do
    user { association :user }
    graduation { association :graduation }
  end
end
