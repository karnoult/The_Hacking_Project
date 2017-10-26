class Lecon < ApplicationRecord
  validates :titre, presence: true, length: { in: 4..50 }, uniqueness: true
  validates :contenu, presence: true
  belongs_to :cour
end
