class Public::ApplicationController < ApplicationController
	  before_action :current_user
     before_action :configure_permitted_parameters, if: :devise_controller?
    add_flash_types :success, :info, :warning, :danger


def after_sign_in_path_for(resource)
  case resource
  when User
    public_user_path(resource.id)
  when Admin
    admin_orders_path
  end
end

def after_sign_up_path_for(resource)
  case resource
  when User
    public_user_path(resource.id)
  when Admin
    admin_orders_path
  end
end

def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname, :lastname_kana, :firstname_kana, :postalcode, :address, :phone])
  end

  def authenticate_user

   if @current_user == nil

    redirect_to("/login")

end

end

end
