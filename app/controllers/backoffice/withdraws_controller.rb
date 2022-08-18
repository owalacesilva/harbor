class Backoffice::WithdrawsController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = define_filters('withdraws')
    @withdraws = WithdrawsQuery.call(relation: current_user, filters: @filters)
  end

  def show
  end

  def create
  end

  def cancel
  end
end
