class Gossip < ApplicationRecord
  validates :author, presence: true
  validates :content, presence: true
end
