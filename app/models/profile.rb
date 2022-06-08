# The Profile class is responsible for ...

class Profile < ApplicationRecord
  enum :gender, {
    undefined: "undefined",
    male: "male",
    female: "female",
  }

  belongs_to :user, optional: false

  validates :first_name, presence: true
  validates :gender, presence: true
  validates :gender, inclusion: %w[male famale undefined]
end
