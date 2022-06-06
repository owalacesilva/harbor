# The Withdraw class is responsible for ...

class Withdraw < ApplicationRecord
  belongs_to :user, class_name: "User", optional: false
  belongs_to :wallet, class_name: "Wallet", optional: false
end
