class ApplicationController < ActionController::Base
  include InheritedResources::DSL
  
  def forem_user
    current_user
  end
  helper_method :forem_user

  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end  
end
