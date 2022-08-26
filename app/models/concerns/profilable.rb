# This class is responsible for ...

module Profilable
  extend ActiveSupport::Concern

  included do
    has_one :profile, dependent: :destroy

    # @see https://coderwall.com/p/wamyow/using-delegate-in-rails
    delegate :first_name, to: :profile, prefix: true
    delegate :last_name, to: :profile, prefix: true

    accepts_nested_attributes_for :profile
  end

  def full_name
    [profile_first_name, profile_last_name].compact.join("\s")
  end
end
