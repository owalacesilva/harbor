# The Transaction class is responsible for ...

class Transaction < ApplicationRecord
  include Codeable

  enum operation: {
    income: 'income',
    expense: 'expense',
  }, _prefix: :operation

  belongs_to :user, optional: false
  belongs_to :origin_wallet, class_name: "Wallet", optional: false
  belongs_to :target_wallet, class_name: "Wallet", optional: false
  belongs_to :reference, optional: false
  belongs_to :withdraw, optional: true
  belongs_to :purchase, optional: true

  validates :code, presence: true
  validates :code, uniqueness: true
  validates :operation, presence: true

  paginates_per 10
end
