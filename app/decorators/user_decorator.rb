# This class is responsible for ...

class UserDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def joined_at
    object.created_at.strftime("%d/%m/%Y")
  end
end
