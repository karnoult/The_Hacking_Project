class Pin < ApplicationRecord
  validates :url_image, presence: true
  belongs_to :utilisateur
  has_many :commentaires
  validates_associated :commentaires
end
