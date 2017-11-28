class Map < ApplicationRecord
  attr_accessor :latitude
  attr_accessor :longitude
  attr_accessor :message

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :message, presence: true, length: { maximum: 10 }
end
