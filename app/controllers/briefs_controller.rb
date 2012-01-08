class BriefsController < InheritedResources::Base
  load_and_authorize_resource
  before_filter :load_project
  
  private
  
    def load_project
      @project = resource.project
    end
end