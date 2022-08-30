# The Qualification class is responsible for ...

class Qualification < ApplicationRecord
  has_many :user_qualifications, dependent: :destroy

  validates :unique_name, presence: true
  validates :unique_name, uniqueness: true
  validates :display_name, presence: true
end
