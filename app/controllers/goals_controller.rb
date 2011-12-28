class GoalsController < ApplicationController
  before_filter :load_site
  
  def index
  end
  
  private
  
    def load_site
      @site = Site.find(params[:site_id])
      authorize! :read, @site
    end

end