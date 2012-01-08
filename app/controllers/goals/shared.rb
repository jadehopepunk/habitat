module Goals::Shared
  def self.included(base)
    base.inherit_resources
    base.load_and_authorize_resource
    base.send(:belongs_to, :brief)
    base.before_filter :load_project
    base.send(:actions, :all, :except => :show)
    
    base.send(:define_method, :index) do
      flash.keep
      redirect_to @brief
    end
  
    base.send(:define_method, :update) do
      update! do |success, failure|
        success.html { redirect_to @brief }
      end
    end

    base.send(:define_method, :create) do
      create! do |success, failure|
        success.html { redirect_to @brief }
      end
    end

    base.send(:define_method, :destroy) do
      destroy! do |success, failure|
        success.html { redirect_to @brief }
      end
    end
  end

  private

    def load_project
      @project = @brief.project
    end
end