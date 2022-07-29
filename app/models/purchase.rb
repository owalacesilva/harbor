# The Transaction class is responsible for ...

class Purchase < ApplicationRecord
  include Codeable

  belongs_to :user, optional: false

  validates :code, presence: true
  validates :code, uniqueness: true
end
