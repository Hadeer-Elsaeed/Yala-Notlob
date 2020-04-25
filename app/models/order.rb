class Order < ApplicationRecord
  belongs_to :User
  has_many:order_friend
  has_many:users, through: :order_friend
  has_many:order_groups
  has_many:groups, through: :order_groups
  has_many:order_details
end
