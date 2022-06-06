# The BankingAccount class is responsible for ...

class BankingAccount < ApplicationRecord
  belongs_to :user, optional: false
end
