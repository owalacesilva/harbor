# This class is responsible for ...

class TransactionDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def joined_at
    object.created_at.strftime("%d/%m/%y")
  end

  def code_formatted
    h.content_tag(:pre, object.code)
  end

  def point_amount_formatted
    h.number_to_currency(object.point_amount, unit: "BTC\s",
      separator: '.', delimiter: '', format: '%n %u', raise: true)
  end

  def amount_formatted
    h.number_to_currency(object.amount, unit: "R$\s",
      separator: ',', delimiter: '', raise: true)
  end
end
