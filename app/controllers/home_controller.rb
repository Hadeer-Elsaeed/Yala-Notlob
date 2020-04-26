class HomeController < ApplicationController
  
  def index
    @latest_orders = Order.select("meal","created_at","resturant").limit(5).where("User_id=?",current_user.id)
  end
end
