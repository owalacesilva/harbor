# The Role class is responsible for ...

class Reference < ApplicationRecord
  validates :unique_name, presence: true
  validates :unique_name, uniqueness: true
  validates :display_name, presence: true
end
