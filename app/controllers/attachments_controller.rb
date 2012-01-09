class AttachmentsController < InheritedResources::Base
  belongs_to :project
  before_filter :load_scope
  load_and_authorize_resource

  create! do |success, failure|
    success.html { redirect_to project_scope_attachments_path }
  end  
  
  update! do |success, failure|
    success.html { redirect_to project_scope_attachments_path }
  end  

  destroy! do |success, failure|
    success.html { redirect_to project_scope_attachments_path }
  end  
  
  private
  
    def load_scope
      raise ArgumentError if params[:scope_id].blank?
      @scope = AttachmentScope.find(params[:scope_id])
    end

    def build_resource
      get_resource_ivar || set_resource_ivar(build_new_resource)
    end
    
    def build_new_resource
      result = end_of_association_chain.send(method_for_build, *resource_params)
      result.scope = @scope.to_s
      result
    end
    
    def attachment_container_url
      case @scope.to_s
      when 'goals'
        @project.brief
      end
    end
  
end