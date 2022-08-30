FactoryBot.define do
  factory :user_qualification do
    user { association :user }
    qualification { association :qualification }
  end
end
