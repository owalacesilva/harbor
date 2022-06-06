# The BankingAccount class is responsible for ...

class BankingAccount < ApplicationRecord
  belongs_to :user, class_name: "User", optional: false
end
