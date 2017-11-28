class Map < ApplicationRecord
  attr_accessor :latitude
  attr_accessor :longitude
  attr_accessor :message

  validates :latitude, presence: true, numericality: {
    greater_than_or_equal_to: -90,
    less_than_or_equal_to: 90
  }
  validates :longitude, presence: true, numericality: {
    greater_than_or_equal_to: -180,
    less_than_or_equal_to: 180
  }
  validates :message, presence: true, length: { maximum: 50 }
end
