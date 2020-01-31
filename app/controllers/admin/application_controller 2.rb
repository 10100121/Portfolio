class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  before_action :admin_user

  private
    def admin_user
      redirect_to new_admin_session_path unless admin_signed_in?
    end
end

