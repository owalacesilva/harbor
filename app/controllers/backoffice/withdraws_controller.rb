class Backoffice::WithdrawsController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = define_filters('withdraws')
    query = WithdrawsQuery.call(relation: current_user, filters: @filters)
    @withdraws = query.page(params[:page]).per(params[:limit])
  end

  def show
  end

  def create
  end

  def cancel
  end
end
