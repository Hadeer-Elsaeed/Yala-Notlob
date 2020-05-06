class HomeController < ApplicationController
  
  def index
    @latest_orders = Order.select("meal","created_at","resturant").where("User_id=?",current_user.id).last(5).reverse
    # @order = current_user.followers
    # @orders = Order.includes(current_user.followers).select('User_id').distinct
    @orders = Order.joins(:User).where("users.id" => current_user.follower_ids).select('User_id').distinct

    # @friends.each do |friend|
    #       @friends_order = Order.select("meal","created_at","resturant").where("User_id=?",friend.id)
    # end

    # @friends_name = User.includes(:orders).where(id: current_user.follower_ids)
  end
end
