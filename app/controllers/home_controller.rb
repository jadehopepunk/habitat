class HomeController < ApplicationController
  def index
    if user_signed_in?
      flash.keep
      if current_user.project
        redirect_to current_user.project
      else
        redirect_to new_project_path
      end
    else
      @user = User.new
      render :layout => 'home'
    end
  end
end