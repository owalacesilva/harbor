# This class is responsible for ...

module Addressable
  extend ActiveSupport::Concern

  included do
    has_one :address, class_name: 'Address', dependent: :destroy

    accepts_nested_attributes_for :address
  end
end
