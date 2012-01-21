class AttachmentsController < InheritedResources::Base
  belongs_to :project
  before_filter :load_scope
  load_and_authorize_resource
  before_filter :target

  create! do |success, failure|
    success.html { redirect_to attachment_return_url }
  end  
  
  update! do |success, failure|
    success.html { redirect_to attachment_return_url }
  end  

  destroy! do |success, failure|
    success.html { redirect_to attachment_return_url }
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
    
    def attachment_return_url
      if @target
        @target
      elsif parent
        project_attachments_path(parent)
      else
        attachments_path
      end
    end
    helper_method :attachment_return_url

end