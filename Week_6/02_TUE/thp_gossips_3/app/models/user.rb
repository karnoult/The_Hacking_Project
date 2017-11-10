class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :gossips, foreign_key: 'creator_id'

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { in: 3..20 }
  # format: { with: /\A[a-zA-Z0-9_]*\z/ }

  attr_accessor :sign_up_code
  validates :sign_up_code,
            on: :create,
            presence: true,
            inclusion: { in: ['GOSSIP_2017'] }

  def self.from_facebook(auth)
    user = where(email: auth.info.email).first
    if !user
      user = User.new
      user.facebook_id = auth.uid
      user.email = auth.info.email
      user.username = auth.info.name
      user.password = Devise.friendly_token[0, 20]
      user.sign_up_code = 'GOSSIP_2017'
      user.save
    elsif user.facebook_id == ''
      user.facebook_id = auth.uid
      user.sign_up_code = 'GOSSIP_2017'
      user.save
    end
    user
  end
end
