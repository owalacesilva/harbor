# The Withdraw class is responsible for ...

class Withdraw < ApplicationRecord
  include Blockable

  belongs_to :user, optional: false
  belongs_to :wallet, optional: false
end
