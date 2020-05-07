class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.where("User_id=?",current_user.id)
    @new_group = Group.new
    @new_friend = Friendship.find(2);
    
    @first_group = Group.first
    if @first_group
      @frinds_group = Friendship.where("group_id=?",@first_group.id)
    end
    

  end

  # def add_friend_group
  #   @friendship = Friendship.new()
  #   @user=User.find_by(email: friendship_params[:virtual_attribute])
  #   notAfollower=current_user.followers.find_by(email: friendship_params[:virtual_attribute])
  #     if @user != nil and  notAfollower== nil
  #         @friendship.follower = @user;
  #         @friendship.User_id=current_user.id
  #         @friendship.followee=current_user if current_user
  #     end
  # end
  # helper_method :add_friend_group

  # GET /groups/1
  # GET /groups/1.json
  def show
    @frinds_group = Friendship.where("group_id=?",params[:id])
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.User_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, User_id: current_user.id)
    end
end
