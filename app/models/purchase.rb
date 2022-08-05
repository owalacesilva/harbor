# The Transaction class is responsible for ...

class Purchase < ApplicationRecord
  include Codeable

  enum status: {
    pending:  'pending',
    canceled: 'canceled',
    expired:  'expired',
    refused:  'refused',
    paid:     'paid',
  }, _prefix: :status

  belongs_to :user, optional: false
  belongs_to :reference, optional: false

  has_many :transactions, dependent: :destroy

  validates :code, presence: true
  validates :status, presence: true
  validates :status, inclusion: statuses.keys
  validates :code, uniqueness: true
end
