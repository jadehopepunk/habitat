class LabourInputGoalsController < InheritedResources::Base
  autocomplete :job, :name
  load_and_authorize_resource
  belongs_to :site

  actions :all, :except => :show
  
  def index
    redirect_to site_goals_path(@site)
  end
end