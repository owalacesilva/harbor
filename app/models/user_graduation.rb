class UserGraduation < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :graduation, optional: false
end
