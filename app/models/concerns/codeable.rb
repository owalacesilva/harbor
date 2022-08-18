# This class is responsible for ...

module Codeable
  extend ActiveSupport::Concern

  included do
    before_validation do
      self.code = generate_code(10) if code.blank?
    end
  end

  def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end
end
