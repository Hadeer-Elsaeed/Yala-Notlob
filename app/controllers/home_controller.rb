class HomeController < ApplicationController
  
  def index
    @latest_orders = Order.select("meal","created_at","resturant").where("User_id=?",current_user.id).last(5).reverse
    @friends_order = Order.select("meal","created_at","resturant").where.not("User_id=?",current_user.id).last(5).reverse

    # @friends_name = User.includes(:orders).where(id: current_user.follower_ids)
    # @friends_order = Order.includes("User_id=?",@friends_name)

    @friends = current_user.followers
  end
end
