class Backoffice::AddressController < ApplicationController
  before_action :authenticate_user!
  before_action { @user = current_user }

  def index; end

  def update
    if @user.update(user_params)
      redirect_to backoffice_address_path, notice: 'Endereço atualizada'
    else
      flash.now[:alert] = @user.errors.full_messages
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:address_attributes => [
      :postal_code, :street_address, :building_number, :neighborhood, :city,
          :state_abbr, :recipient])
  end
end
