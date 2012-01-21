class AttachmentsController < InheritedResources::Base
  belongs_to :project
  before_filter :load_scope
  load_and_authorize_resource
  before_filter :target

  create! do |success, failure|
    success.html { redirect_to :action => :index }
  end  
  
  update! do |success, failure|
    success.html { redirect_to :action => :index }
  end  

  destroy! do |success, failure|
    success.html { redirect_to :action => :index }
  end  
  
  private
  
    def end_of_association_chain
      target.attachments
    end
  
    def load_scope
      if params[:scope_id]
        @scope = AttachmentScope.find(params[:scope_id])
      end
    end
    
    def target
      @target ||= load_target
    end
    
    def load_target
      raise ArgumentError unless params[:target_type]
      raise ArgumentError unless params[:target_id]
      
      target_class = params[:target_type].classify.constantize
      target_class.find(params[:target_id])
    end

    def resource_params
      result = super
      result[0][:project] = parent
      result
    end

    # def build_resource
    #   get_resource_ivar || set_resource_ivar(build_new_resource)
    # end
    # 
    # def build_new_resource
    #   raise method_for_build.inspect
    #   end_of_association_chain
    #   method_for_build
    #   resource_params
    #   result = end_of_association_chain.send(method_for_build, *resource_params)
    #   result
    # end
    
    def attachment_container_url
      case @scope.to_s
      when 'goals'
        @project.brief
      end
    end
  
end