class GoalsController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :site
  
  def index
    @site = Site.find(params[:site_id])
  end

end