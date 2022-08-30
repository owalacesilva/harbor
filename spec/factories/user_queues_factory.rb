FactoryBot.define do
  factory :user_queue do
    user { association :user }
    user_sponsor { association :user }

    done { false }
    side { 'left' }

    trait :with_done do
      done { true }
      done_at { Time.current }
    end
  end
end
