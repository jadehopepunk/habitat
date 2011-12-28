class SitesController < InheritedResources::Base
  load_and_authorize_resource
  
  add_crumb("Sites") { |instance| instance.send :sites_path }
  add_crumb(lambda {|instance| instance.resource_display_name}, :only => [:show, :edit, :update])
  add_crumb('New Site', :only => [:new, :create])
  
  def resource_display_name
    resource.display_name
  end
  
  protected
  
    def build_resource
      get_resource_ivar || set_resource_ivar(build_new_resource)
    end
    
    def build_new_resource
      result = end_of_association_chain.send(method_for_build, *resource_params)
      result.user = current_user
      result
    end
  
end