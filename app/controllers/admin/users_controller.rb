class Admin::UsersController < InheritedResources::Base
  load_and_authorize_resource
  actions :all, :except => :show

  add_crumb("Users") { |instance| instance.send :admin_users_path }
  add_crumb(lambda {|instance| instance.resource_email}, :only => [:show, :edit, :update])
  
  def update
    resource
    resource.role = params[:user].delete(:role) if params[:user][:role]
    update!
  end
  
  def resource_email
    resource.email if resource
  end
end