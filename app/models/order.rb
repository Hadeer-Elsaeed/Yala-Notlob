class Order < ApplicationRecord
  myorderfriends=Array.new
  belongs_to :user
  has_many:order_friend
  has_many:users, through: :order_friend
  has_many:order_groups
  has_many:groups, through: :order_groups
  has_many:order_details
  has_one_attached :image
  attr_accessor :myorderfriends
  def myorderfriends
    @myorderfriends
  end

#setter
def myorderfriends=(value)
  @myorderfriends = value
end 
end
