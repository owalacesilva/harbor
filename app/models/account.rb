# The Account class is responsible for ...

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role, optional: false

  validates :email, presence: true
  validates :password, presence: true

  before_validation :default_role, on: [:create]

  def default_role
    self.role = Role.employee if role.nil?
  end
end
