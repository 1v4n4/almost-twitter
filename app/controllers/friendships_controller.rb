class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show]

  # GET /friendships or /friendships.json
  def index
    #@confirmed = Friendship.where('friend_id = ? and confirm = ?', current_user.id, true)
    @confirmed = current_user.friendships.where(:confirm => true).or(Friendship.where(:friend_id => current_user.id, :confirm => true ))
    @received = Friendship.where(:friend_id => current_user.id, :confirm => false)
    @sent = Friendship.where(:user_id => current_user.id, :confirm => false)
  end

  # GET /friendships/1 or /friendships/1.json
  def show

  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships or /friendships.json
  def create
    user = User.find(params[:friend_id])
    if current_user == user
      redirect_to root_path, notice: "You can't send request to yourself"
      return
    elsif Friendship.where(friend_id: user.id, user_id: current_user, confirm: false).exists?
      redirect_to root_path, notice: "Friend request already sent"
      return
    elsif Friendship.where(friend_id: current_user, user_id: user.id, confirm: false).exists?
      redirect_to root_path, notice: "This user already sent friend request to you. Respond to it!"
      return
    end
    @friendship = current_user.friendships.build(friend_id: user.id)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to root_path, notice: "Friends request sent" }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendships/1 or /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: "Friend request accepted!" }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1 or /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: "Friens request denied" }
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
      params.require(:friendship).permit(:confirm)
    end
end
