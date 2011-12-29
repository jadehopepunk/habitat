class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.site
        redirect_to current_user.site
      else
        redirect_to new_site_path
      end
    else
      @user = User.new
      render :layout => 'home'
    end
  end
end