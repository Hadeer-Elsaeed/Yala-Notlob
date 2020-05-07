class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.paginate(page: params[:page], per_page: 3)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order_detail = @order.order_details.build
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end
  
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    puts params
    friends=params[:friends]
    groups=params[:groups]
    check= params[:check]
  
    # puts params[:friends]
    # puts friends
    @order.User_id = current_user.id if current_user
    @order.status="waiting"
    @myusers=User.all
      #  byebug
    if check == nil
    friends.each do |friend|
      # puts friend
      @order_friend=OrderFriend.new
      @order_friend.order=@order
      @order_friend.user=@myusers.find_by(id:friend)
      @order_friend.save
      Friendship.where(:follower_id => friend).where(:followee_id => @order.User_id).update_all("status = 'invited'")
    end
    end
      if check == "on"
         @mygroups=Group.all
        groups.each do |group|
          @order_group=OrderGroup.new
           @order_group.order=@order
           @order_group.group=@mygroups.find_by(id:group)
           @order_group.save
          Friendship.where(:followee_id => current_user.id).where(:group_id => group).update_all("status = 'invited'")

        end  
      end

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_url, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: orders_url }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def invited 
    puts "that is modal :))))))))))))))))))))))))))))))))"  
    # @inv_user_info = []
    @owner_id = Order.find(params[:id]).User_id 
    @invited_users =  Friendship.where(:User_id => @owner_id)
    @invited_users.each do |invited_users|
    puts invited_users.User_id
    end
      respond_to do |format|
      format.html 
      format.js
    end
    puts"end:)))))))))))))))))))))))))))))))"
  end
  def joined
    @user = Order.find(params[:id]).User_id    
    @joined_users =  Friendship.where(:User_id => @user , :status => "joined")  
    @joined_users.each do |joined_users| 
       puts joined_users.followee_id
       @joined_users_info =User.find_by(id:joined_users.followee_id)
     end 
     puts @joined_users_info
    
    respond_to do |format|
      format.html 
      format.js
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:meal, :resturant, :status, :User_id,:image)
    end


    def chngstatus (_id)
      puts "eroooooooooooooooooooooo"      
      ord= Order.find_by(id: _id)
      ord.update(status: 'finished')
      ord.errors.messages
    end
    helper_method :chngstatus
  
  
end
