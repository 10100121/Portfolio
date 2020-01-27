class Public::DmsController < Public::ApplicationController
	before_action :authenticate_user!, :only => [:create]

  def index
  end

  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:dm][:room_id]).present?
      @dms = Dm.create(params.require(:dm).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
      redirect_to public_room_path(@dms.room.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def new
  end

  def destroy
  end
end
