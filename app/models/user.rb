# The User class is responsible for ...

class User < ApplicationRecord
  include Profilable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :banking_accounts, dependent: :destroy
  has_many :wallets, dependent: :destroy
  has_many :withdraws, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true
end
