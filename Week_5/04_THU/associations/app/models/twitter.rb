class Twitter < ApplicationRecord
  has_many :tweets

  has_many :sent_messages, class_name: "Message"

  has_and_belongs_to_many :likes, class_name: "Tweet"

  has_and_belongs_to_many :received_messages, class_name: "Message"

  has_and_belongs_to_many :followers, class_name: "Twitter", foreign_key: "following_id"

  has_and_belongs_to_many :followings, class_name: "Twitter", foreign_key: "follower_id"
end
