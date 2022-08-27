class Notification < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true

  validates :title, presence: true
  validates :message, presence: true
end
