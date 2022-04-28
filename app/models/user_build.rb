class UserBuild < ApplicationRecord
  belongs_to :user
  belongs_to :build
end
