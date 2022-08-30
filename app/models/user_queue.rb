class UserQueue < ApplicationRecord

  enum side: {
    left: 'left',
    right: 'right',
  }, _prefix: :side

  belongs_to :user, optional: false
  belongs_to :user_sponsor, class_name: 'User', optional: false

  validates :side, presence: true

  scope :not_spilled_by_old, -> { where(done: false).order(created_at: :asc) }
end
