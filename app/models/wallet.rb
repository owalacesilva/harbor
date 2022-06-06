# The User class is responsible for ...

class Wallet < ApplicationRecord
  belongs_to :user, class_name: "User", optional: false
end
