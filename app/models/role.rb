# The Role class is responsible for ...

class Role < ApplicationRecord
  has_many :accounts, class_name: "Account", dependent: :destroy

  validates :unique_name, presence: true
  validates :unique_name, uniqueness: true
  validates :display_name, presence: true
end
