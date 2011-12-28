class GoalsController < ApplicationController
  inherit_resources
  belongs_to :site

  layout 'site'
  
  def index
    @site = Site.find(params[:site_id])
  end

end