class OrderDetailsController < ApplicationController
  before_action :set_order_detail, only: [:show, :edit, :update, :destroy]

  # GET /order_details
  # GET /order_details.json
  def index
    @order = Order.find(params[:order_id])
    @order_detail = @order.order_details.all
    # @order_detail = OrderDetail.all
    # @user_name = User.find(uid=@user)
  end

  # GET /order_details/1
  # GET /order_details/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
      format.json { render json: @order_detail }
    end
  end

  # GET /order_details/new
  def new
    # creatte empty instance to use in form""model:"
    # @order_detail = OrderDetail.new
    @order =Order.find(params[:order_id])
    puts @order 
    # it is empy!!!!!!why?! 

  end

  # GET /orders/:id/order_details/:id/edit
  def edit
  end

  # POST /order_details
  # POST /order_details.json
  
  def create
    @order = Order.find(params[:order_id])
    @order_detail = @order.order_details.create(order_detail_params)
    @order_detail.user_id =  current_user.id
    @order_detail.order_id = @order.id
    respond_to do |format|
      if @order_detail.save
        format.html { redirect_to order_order_details_path, notice: 'Order detail was successfully created.' }
        format.json { render :show, status: :created, location: @order_detail }
      else
        format.html { render :new }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_details/1
  # PATCH/PUT /order_details/1.json
  def update
    respond_to do |format|
      if @order_detail.update(order_detail_params)
        format.html { redirect_to order_order_detail_path, notice: 'Order detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_detail }
      else
        format.html { render :edit }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_details/1
  # DELETE /order_details/1.json
  def destroy
    @order_detail.destroy
    respond_to do |format|
      format.html { redirect_to order_order_details_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_detail
      @order = Order.find(params[:order_id])
      @order_detail  = @order.order_details.find(params[:id])
    end

    # Only allow a list of trusted parameters through.**white listing**
    def order_detail_params
      params.require(:order_detail).permit(:item, :amount, :price, :comment, :user_id, :order_id)
    end
end
