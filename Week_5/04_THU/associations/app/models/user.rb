class User < ApplicationRecord
  has_many :videos
  has_and_belongs_to_many :categories
end
