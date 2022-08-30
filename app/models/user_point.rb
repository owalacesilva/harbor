class UserPoint < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :reference, optional: false

  validates :amount, presence: true
end
