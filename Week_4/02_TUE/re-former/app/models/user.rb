class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true
  validates :bio, presence: true
end
