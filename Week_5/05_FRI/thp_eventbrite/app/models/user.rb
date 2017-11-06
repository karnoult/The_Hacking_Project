class User < ApplicationRecord

  has_secure_password

  has_many :created_events, class_name: "Event", foreign_key: "creator_id"
  has_and_belongs_to_many :participated_events, class_name: "Event"
end
