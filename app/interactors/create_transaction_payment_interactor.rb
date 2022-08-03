# frozen_string_literal: true

class CreateTransactionPaymentInteractor
  include Interactor

  def call
    ActiveRecord::Base.transaction { actions }
  rescue ActiveRecord::RecordNotFound => e
    context.fail!(message: e.message)
  end

  private

  def actions
    valid_user!
    create_wallet_balance
  end

  def valid_user!
    raise "User invalid" if context.user.blank?
  end

  def create_wallet_balance
    balance = wallet.balance + transaction.amount
    incomes = wallet.incomes + transaction.amount
    wallet.update!(balance: balance, incomes: incomes)
  end

  def wallet
    context.user.wallet
  end

  def transaction
    context.transaction
  end
end
