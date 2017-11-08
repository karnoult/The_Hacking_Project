class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :gossips, foreign_key: 'creator_id'

  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { in: 3..10 },
    format: { with: /\A[a-zA-Z0-9_]*\z/ }

  attr_accessor :sign_up_code
  validates :sign_up_code,
    on: :create,
    presence: true,
    inclusion: { in: ["GOSSIP_2017"] }
end
