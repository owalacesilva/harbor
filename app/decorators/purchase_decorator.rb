class PurchaseDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def joined_at
    object.created_at.strftime("%d/%m/%Y")
  end

  def code_formatted
    h.content_tag(:pre, object.code)
  end

  def amount_formatted
    h.number_to_currency(object.amount, unit: "BTC\s",
      separator: '.', delimiter: '', format: '%n %u', raise: true)
  end

  def total_formatted
    h.number_to_currency(object.total, unit: "R$\s",
      separator: ',', delimiter: '', raise: true)
  end
end
