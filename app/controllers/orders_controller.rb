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
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  #change the status of order
  def chngstatus(_id)
   ord= Order.find_by(id: _id)
   ord.update(status: 'finished')
  end
  helper_method :chngstatus

  def update_my_model_status(model,id,field, value)
    @model_var = model.find(id)
    @model.update_attributes(field: value)
  end

  # POST /orders
  # POST /orders.json
  def create
    #print order_params;
    @order = Order.new(order_params)
    friends=params[:friends]
    puts params[:friends]
    puts friends
    @order.User = current_user if current_user
    @order.status="waiting"
    @myusers=User.all

    friends.each do |friend|
      puts friend
      @order_friend=OrderFriend.new
      @order_friend.order=@order
      @order_friend.user=@myusers.find_by(id:friend)
      @order_friend.save
      # Friendship.update_all({:status => 'invited'}, {:follower_id => friend, :followee_id => @order.User_id})  
      Friendship.where(:follower_id => friend).where(:followee_id => @order.User_id).update_all("status = 'invited'")
    end
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:meal, :resturant, :status, :User_id,:image)
    end
end
