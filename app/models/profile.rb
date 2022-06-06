# The Profile class is responsible for ...

class Profile < ApplicationRecord
  has_one :account, dependent: :destroy
  has_one :user, dependent: :destroy

  enum :gender, {
    undefined: "undefined",
    male: "male",
    female: "female",
  }

  validates :first_name, presence: true
  validates :gender, presence: true
  validates :gender, inclusion: %w[male famale undefined]
end
