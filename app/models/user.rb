class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :groups
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatables,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :friendships, :foreign_key => "user_id", 
         :class_name => "Friendship"
   
  has_many :friends, :through => :friendship
  before_save { self.email = email.downcase }
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

         def self.create_from_provider_data(provider_data)
          where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
            user.provider = provider_data.provider
            user.uid = provider_data.uid
            user.email = provider_data.info.email
            user.name = provider_data.info.name
            user.password = Devise.friendly_token[0, 20]
            user.skip_confirmation!
            user.save!
          end
        end
end
