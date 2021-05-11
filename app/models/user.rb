class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true
  has_one_attached :avatar
end
