class Goals::Base < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :brief
  before_filter :load_project
  
  actions :all, :except => :show
  
  def index
    flash.keep
    redirect_to @brief
  end
  
  private
  
    def load_project
      @project = @brief.project
    end
end