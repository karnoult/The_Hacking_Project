class Commentaire < ApplicationRecord
  validates :contenu, presence: true
  belongs_to :pin
  belongs_to :utilisateur
end
