module Goals::Shared
  def self.included(base)
    base.inherit_resources
    base.load_and_authorize_resource
    base.send(:belongs_to, :brief)
    base.before_filter :load_project
    base.send(:actions, :all, :except => :show)
  end
  
  def index
    flash.keep
    redirect_to @brief
  end
  
  private
  
    def load_project
      @project = @brief.project
    end
end