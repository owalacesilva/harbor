class Backoffice::PasswordController < ApplicationController
  before_action :authenticate_user!
  before_action { @user = current_user }
  before_action :valid_current_password?, only: [:update]

  def index; end

  def update
    return redirect_to_index if @user.update(user_params)

    flash.now[:alert] = @user.errors.full_messages
    render :index
  end

  private

  def redirect_to_index
    redirect_to action: :index, status: :found, notice: 'Senha atualizada'
  end

  def valid_current_password?
    return if @user.valid_password?(params.fetch(:user).permit(:current_password))

    flash.now[:alert] = 'Senha atual inválida'
    render :index
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
