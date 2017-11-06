class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :duration, presence: true, numericality: { only_integer: true }
  validates :departure_date, presence: true
  validates :departure_airport, presence: true
  validates :arrival_airport, presence: true
end
