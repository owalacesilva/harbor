class UserQualification < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :qualification, optional: false
end
