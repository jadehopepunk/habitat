class GoalsController < ApplicationController
  before_filter :load_project
  
  def index
  end
  
  private
  
    def load_project
      @project = Project.find(params[:project_id])
      authorize! :read, @project
    end

end