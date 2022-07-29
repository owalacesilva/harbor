# This class is responsible for ...

module Codeable
  extend ActiveSupport::Concern

  included do
    before_validation :g_code
  end

  def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end

  def g_code
    self.code = generate_code(10)
  end
end
