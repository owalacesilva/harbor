# The Withdraw class is responsible for ...

class Withdraw < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :wallet, optional: false
end
