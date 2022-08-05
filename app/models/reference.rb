# The Role class is responsible for ...

class Reference < ApplicationRecord
  has_many :wallets, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :purchases, dependent: :destroy

  validates :unique_name, presence: true
  validates :unit_price, presence: true
  validates :unique_name, uniqueness: true
  validates :display_name, presence: true

  scope :uname, ->(name) { where(unique_name: name).last }
  scope :token, -> { where(unique_name: :token).last }
end
