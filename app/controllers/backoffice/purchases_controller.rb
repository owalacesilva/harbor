class Backoffice::PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = current_user.purchases.build(purchase_params)
    if @purchase.save
      redirect_to backoffice_purchases_path, notice: 'Compra criada'
    else
      flash.now[:alert] = @purchase.errors.full_messages
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:amount)
  end
end
