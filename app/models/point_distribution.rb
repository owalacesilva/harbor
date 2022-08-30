class PointDistribution < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :reference, optional: false
  belongs_to :purchase, optional: false
  belongs_to :user_point_record, optional: false

  validates :base_value, presence: true
end
