# The Role class is responsible for ...

class Reference < ApplicationRecord
  has_many :wallets, dependent: :destroy
  has_many :transactions, dependent: :destroy

  validates :unique_name, presence: true
  validates :unique_name, uniqueness: true
  validates :display_name, presence: true
end
