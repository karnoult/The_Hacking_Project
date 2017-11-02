class Category < ApplicationRecord
  has_many :videos
  has_and_belongs_to_many :users
end
