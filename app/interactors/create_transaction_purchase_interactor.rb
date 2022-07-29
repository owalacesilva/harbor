# frozen_string_literal: true

class CreateTransactionPurchaseInteractor
  include Interactor

  def call
    create_transaction
  rescue ActiveRecord::RecordNotFound => e
    context.fail!(message: e.message)
  end

  private

  def create_transaction
    context.transaction = Transaction.new(transaction_params)
    context.transaction.save!
  end

  def transaction_params
    { purchase: context.purchase, user: user, origin_wallet: wallet, target_wallet: wallet,
      reference: wallet.reference, operation: Transaction.operations[:income],
      amount: amount, point_amount: amount }
  end

  def user
    context.user
  end

  def wallet
    @wallet ||= user.wallet
  end

  def amount
    @amount ||= context.purchase.amount
  end
end
