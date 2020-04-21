class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :groups
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatables,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

has_many :followed_users, foreign_key: :follower_id, class_name: 'Friendship'
has_many :followees, through: :followed_users

has_many :following_users, foreign_key: :followee_id, class_name: 'Friendship'
has_many :followers, through: :following_users

         def self.create_from_provider_data(provider_data)
          where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
            user.provider = provider_data.provider
            user.uid = provider_data.uid
            user.email = provider_data.info.email
            user.name = provider_data.info.name
            user.password = Devise.friendly_token[0, 20]
          end
        end
end
