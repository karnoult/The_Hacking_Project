class Tweet < ApplicationRecord
  belongs_to :author, class_name: "Twitter"
  has_and_belongs_to_many :likers, class_name: "Twitter"
end
