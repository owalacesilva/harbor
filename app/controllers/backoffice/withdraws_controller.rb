class Backoffice::WithdrawsController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = define_filters('withdraws')
    @withdraws = current_user.withdraws.order(created_at: :desc)
  end

  def show
  end

  def create
  end

  def cancel
  end
end
