class Backoffice::TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = define_filters('transactions')
    query = TransactionsQuery.call(relation: current_user, filters: @filters)
    @transactions = query.page(params[:page]).per(params[:limit])
  end

  def show
    @transaction = Transaction.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :index, status: :not_found
  end
end
