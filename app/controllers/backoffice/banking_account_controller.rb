class Backoffice::BankingAccountController < ApplicationController
  before_action :authenticate_user!
  before_action { @user = current_user }

  def index; end

  def update
    if @user.update(user_params)
      redirect_to backoffice_banking_account_path, notice: 'Conta bancária atualizada'
    else
      flash.now[:alert] = @user.errors.full_messages
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:banking_account_attributes => [
      :bank_code, :branch_number, :branch_code, :account_number, :account_code,
          :document_number])
  end
end
