# The Address class is responsible for ...

class Address < ApplicationRecord
  belongs_to :user, class_name: "User", optional: false
end
