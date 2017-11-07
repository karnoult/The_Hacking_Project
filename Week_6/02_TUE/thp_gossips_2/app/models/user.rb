class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :gossips, foreign_key: 'creator_id'

  validates :username, presence: true, uniqueness: true, length: { in: 3..10 }
end
