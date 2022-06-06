# The Transaction class is responsible for ...

class Transaction < ApplicationRecord
  belongs_to :user, class_name: "User", optional: false
  belongs_to :origin_wallet, class_name: "Wallet", optional: false
  belongs_to :target_wallet, class_name: "Wallet", optional: false
  belongs_to :reference, class_name: "Reference", optional: false
  belongs_to :withdraw, class_name: "Withdraw", optional: true

  validates :code, presence: true
  validates :code, uniqueness: true
end
