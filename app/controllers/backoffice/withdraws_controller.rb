class Backoffice::WithdrawsController < ApplicationController
  before_action :authenticate_user!

  def index
    @withdraws = Withdraw.order(created_at: :desc)
  end

  def show
  end

  def create
  end

  def cancel
  end
end
