# This class is responsible for ...

class WithdrawDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def joined_at
    object.created_at.strftime("%d/%m/%y")
  end

  def balance_formatted
    h.number_to_currency(object.balance, unit: "R$\s",
      separator: ',', delimiter: '', raise: true)
  end
end
