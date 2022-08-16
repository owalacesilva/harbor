# frozen_string_literal: true

class Filter
  attr_accessor :fields

  def initialize(fields:)
    self.fields = fields
  end

  def [](field)
    fields[field]
  end

  def []=(field, value)
    fields[field] = value
  end

  def method_missing(m, *args, &block)
    fields[m.to_sym]
  end
end
