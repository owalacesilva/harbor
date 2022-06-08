# This class is responsible for ...

module Profilable
  extend ActiveSupport::Concern

  included do
    has_one :profile, dependent: :destroy
  end

  def full_name
    [profile.first_name, profile.last_name].compact.join("\s")
  end
end
