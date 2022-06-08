FactoryBot.define do
  factory :banking_account do
    user { association :user }

    bank_code { Faker::Number.number(digits: 3) }
    bank_name { Faker::Bank.name }
    account_type { "checking" } # savings
    branch_number { Faker::Bank.routing_number }
    branch_code { Faker::Number.number(digits: 1) }
    account_number { Faker::Bank.account_number(digits: 5) }
    account_code { Faker::Number.number(digits: 1) }
    holder_name { Faker::Name.name_with_middle }
    document_number { Faker::Number.number(digits: 11) }
    operation { Faker::Number.number(digits: 2) }
  end
end
