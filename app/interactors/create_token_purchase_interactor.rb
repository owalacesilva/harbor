# frozen_string_literal: true

class CreateTokenPurchaseInteractor
  include Interactor

  def call

    context.purchase = Purchase.new(purchase_params)
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

  def find_reference
    context.reference ||= Reference.token
  end

  def amount
    amount = Integer(context.amount)
    return nil unless amount.positive?

    amount
  end

  def total
    (amount * find_reference.unit_price).to_f
  end

  def purchase_params
    { user_id: find_user.id, reference: find_reference,
      amount: amount, total: total, status: Purchase.statuses[:pending] }
  end
end
