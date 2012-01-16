class SiteAnalysesController < ApplicationController
  layout 'site_analysis'
  before_filter :load_project

  def show
  end

  private
  
    def load_project
      @project = Project.find(params[:project_id])
    end
end