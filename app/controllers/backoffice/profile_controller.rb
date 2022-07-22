class Backoffice::ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action { @user = current_user }

  def index; end

  def update
    if @user.update(user_params)
      redirect_to backoffice_profile_path, notice: 'Conta atualizada'
    else
      flash.now[:alert] = @user.errors.full_messages
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,
        :profile_attributes => [:first_name, :last_name, :gender, :birth_date, :phone_number])
  end
end
