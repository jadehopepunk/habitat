module AttachmentsHelper
  def attach_file_button(resource)
    link_url = new_project_attachment_path(attachment_keys(resource))
    link_to 'Attach File', link_url, :class => 'btn'
  end
  
  def manage_attachments_link(resource)
    link_to 'Manage Attachments', project_attachments_path(attachment_keys(resource))
  end
  
  def attachment_keys(resource, attachment = nil)
    resource_type = resource.class.name.underscore.to_sym
    result = {:project_id => resource.project.to_param, :target_id => resource.to_param, :target_type => resource_type}
    result[:id] = attachment.to_param if attachment
    result
  end
end