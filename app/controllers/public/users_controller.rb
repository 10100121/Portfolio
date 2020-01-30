class Public::UsersController < Public::ApplicationController
    before_action :authenticate_user!, :only => [:show]

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
      redirect_to public_user_path(@user.id), flash:{success: "You have updated user successfully."}
   else
      render  action: :edit
   end
  end

  def index
   @user =User.all
   @q = User.ransack(params[:q])
   @users = @q.result
  end


  def show
    @users = current_user
    @user = User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id != current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if !@isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def out
  end

  def destroy
  end

  def search
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

private

  def user_params
   params.require(:user).permit(:nickname, :phone, :email, :profile_image, :user_id)
  end

  def user_find
    @user = User.find(params[:id])
  end

end


