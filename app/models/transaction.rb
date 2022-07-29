# The Transaction class is responsible for ...

class Transaction < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :origin_wallet, class_name: "Wallet", optional: false
  belongs_to :target_wallet, class_name: "Wallet", optional: false
  belongs_to :reference, optional: false
  belongs_to :withdraw, optional: true
  belongs_to :purchase, optional: true

  validates :code, presence: true
  validates :code, uniqueness: true
end
