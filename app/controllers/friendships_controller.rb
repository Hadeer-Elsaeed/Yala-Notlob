class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]
# ActionController::Parameters.action_on_unpermitted_parameters =true
  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
    # @user=User.find_by(email: friendship_params[:virtual_attribute])
    # if @user.group_id != nil
    #   format.html { render :edit }
    # end
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = Friendship.new()
    @user=User.find_by(email: friendship_params[:virtual_attribute])
    notAfollower=current_user.followers.find_by(email: friendship_params[:virtual_attribute])
      if @user != nil and  notAfollower== nil
          @friendship.follower = @user;
          @friendship.User_id=current_user.id
          @friendship.followee=current_user if current_user
      end


    respond_to do |format|
      if @friendship.save
        format.html { redirect_to @friendship, notice: 'Friendship was successfully created.' }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { render :new }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      # :Group_id, :User_id
      params.require(:friendship).permit(:virtual_attribute)
    end
end
