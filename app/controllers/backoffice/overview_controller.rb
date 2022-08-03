class Backoffice::OverviewController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = Transaction.order(created_at: :desc).limit(5)
  end
end
