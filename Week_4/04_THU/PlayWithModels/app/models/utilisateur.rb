class Utilisateur < ApplicationRecord
  validates :nom, presence: true, length: { maximum: 15 }
  has_many :pins
  validates_associated :pins
  has_many :commentaires
  validates_associated :commentaires
end
