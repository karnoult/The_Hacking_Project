class Gossip < ApplicationRecord
  belongs_to :moussaillon
  validates :body, length: { maximum: 2000 }
end
