# The User class is responsible for ...

class User < ApplicationRecord
  include Profilable
  include Addressable

  attr_accessor :email_confirmation, :security_password_confirmation

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :wallet, autosave: true, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :banking_account, dependent: :destroy
  has_many :withdraws, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :transactions, dependent: :destroy
  
  validates :email, presence: true
  validates :email, confirmation: true
  
  before_create :create_user_wallet
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :banking_account

  private

  def create_user_wallet
    build_wallet(reference: Reference.token)
  end
end
