class SoilTestsController < InheritedResources::Base
  layout 'site_analysis'
  belongs_to :site
  load_and_authorize_resource
  before_filter :increment_heading
  before_filter :load_project
  
  private
  
    def load_project
      @project = @site.project
    end
  
end