# frozen_string_literal: true

class CreateTokenPurchaseInteractor
  include Interactor

  def call

    context.purchase = Purchase.new(user_id: find_user.id, amount: amount)
    context.purchase.save!
  rescue ActiveRecord::RecordNotFound => e
    context.fail!(message: e.message)
  rescue ArgumentError => e
    context.fail!(message: e.message)
  rescue TypeError => e
    context.fail!(message: e.message)
  end

  private

  def find_user
    context.user ||= User.find(context.user_id)
  end

  def amount
    amount = Integer(context.amount)
    return nil unless amount.positive?

    amount
  end
end
