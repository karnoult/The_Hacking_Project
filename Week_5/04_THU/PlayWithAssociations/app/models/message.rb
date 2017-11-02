class Message < ApplicationRecord
  belongs_to :sender, class_name: "Twitter"

  has_and_belongs_to_many :recipients, class_name: "Twitter"
end
