class Backoffice::TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :index, status: :not_found
  end
end
