class SitesController < ApplicationController
  inherit_resources
  add_crumb("Sites") { |instance| instance.send :sites_path }
  add_crumb(lambda {|instance| instance.resource_display_name}, :only => [:show, :edit, :update])
  add_crumb('New Site', :only => [:new, :create])
  
  def show
    show! do
      @json = @site.to_gmaps4rails
    end
  end
  
  def resource_display_name
    resource.display_name
  end
end