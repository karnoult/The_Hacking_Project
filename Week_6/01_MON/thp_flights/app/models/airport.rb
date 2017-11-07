class Airport < ApplicationRecord
  validates :airport_code, presence: true, length: { maximum: 3 }
end
