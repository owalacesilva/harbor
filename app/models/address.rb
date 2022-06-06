# The Address class is responsible for ...

class Address < ApplicationRecord
  belongs_to :user, optional: false
end
