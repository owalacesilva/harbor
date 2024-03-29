class Backoffice::PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = define_filters('purchases')
    query = PurchasesQuery.call(relation: current_user, filters: @filters)
    @purchases = query.order(created_at: :desc)
      .page(params[:page])
      .per(params[:limit])
      .decorate
  end

  def show;end

  def new
    @purchase = Purchase.new
  end

  def create
    organizer = BuyTokenOrganizer.call(user_id: current_user.id, amount: purchase_params[:amount])
    if organizer.failure?
      flash.now[:alert] = organizer.message
      render :new
    else
      redirect_to backoffice_purchases_path, notice: 'Compra criada'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:amount)
  end
end
