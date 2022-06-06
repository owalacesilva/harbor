# This class is responsible for ...

module Profilable
  extend ActiveSupport::Concern

  included do
    belongs_to :profile, optional: false
  end

  def full_name
    [profile.first_name, profile.last_name].compact.join("\s")
  end
end
