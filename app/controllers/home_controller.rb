class HomeController < ApplicationController
  
  def index
    @latest_orders = Order.select("meal","created_at","resturant").where("User_id=?",current_user.id).last(5).reverse
    @friends_order = Order.find(current_user.follower_ids)
    # @friends_with_order = Friendship.find(@friends_order.User_id)
    @friends = current_user.followers
  end
end
