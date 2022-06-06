# The User class is responsible for ...

class Wallet < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :reference, optional: false
  has_many :origin_transactions, class_name: "Transaction", inverse_of: :origin_wallet, dependent: :destroy
  has_many :target_transactions, class_name: "Transaction", inverse_of: :target_wallet, dependent: :destroy
end
