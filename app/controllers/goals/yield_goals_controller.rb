class Goals::YieldGoalsController < InheritedResources::Base
  autocomplete :use, :name
  
  load_and_authorize_resource
  belongs_to :project
  
  actions :all, :except => :show
  
  def index
    redirect_to project_goals_path(@project)
  end
end