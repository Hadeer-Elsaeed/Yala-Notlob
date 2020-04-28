class Group < ApplicationRecord
  belongs_to :User
  # has_many:friendships
  # has_many :users
  has_many:order_groups
  has_many:orders, through: :order_groups
end
