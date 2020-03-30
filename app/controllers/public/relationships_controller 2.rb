class Public::RelationshipsController < Public::ApplicationController
 def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    redirect_to public_users_path(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to public_users_path(@user)
  end

 # def destroy
   # @user = Relationship.find(params[:id]).following
    #current_user.unfollow!(@user)
    #redirect_to public_users_path
    #followed = Relationship.find(params[:id]).following
    #@relationship = current_user.unfollow!(@user)
    #@relationship.destroy
    #if @relationship.destroy
     # flash[:notice] = followed.nickname += "さんのフォローを解除しました。"
     # redirect_back(fallback_location: root_path)
    #else
     # flash[:notice] = followed.nickname += "さんのフォローの解除に失敗しました。"
      #redirect_back(fallback_location: root_path)
    #end
  #end
end
