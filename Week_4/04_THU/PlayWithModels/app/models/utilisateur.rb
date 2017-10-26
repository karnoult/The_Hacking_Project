class Utilisateur < ApplicationRecord
  validates :nom, presence: true, length: { maximum: 15 }
  has_many :pins, dependent: :destroy
  validates_associated :pins
  has_many :commentaires, dependent: :destroy
  validates_associated :commentaires
end
