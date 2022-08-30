class UserPointRecord < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :origin_user, class_name: 'User', optional: false
  belongs_to :reference, optional: false

  validates :record_date, presence: true
  validates :base_value, presence: true
  validates :amount, presence: true
end
