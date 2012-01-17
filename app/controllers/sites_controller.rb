class SitesController < InheritedResources::Base
  layout 'site_analysis'
  before_filter :load_project

  private
  
    def load_project
      @project = resource.project
    end
end