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
  
  def attachments_container_link
    if @target
      ' ' + content_tag(:small, link_to("Back to #{@target.name}", @target))
    end
  end

  def file_link_with_icon(text, file)
    if file
      link_to file.url, :class => 'file_link' do
        image_tag(file_icon_url(file.format), :class => 'file_icon') +
        content_tag(:span, text + " (#{file.format.to_s})", :class => "file_link_description")        
      end
    end
  end
  
  def file_icon_link(file, options = {})
    if file
      link_to file.url, :class => 'file_link' do
        image_tag(file_icon_url(file, options), :class => 'file_icon', :alt => file.format)
      end
    end
  end
  
  def file_icon_url(file, options = {})
    if file.format
      image_formats = %w(png jpg gif)
      format_string = file.format.to_s.downcase
      
      vendor_images_path = Rails.root.join("vendor/assets/images")
      icon_path = "file-type-icons/file_icons/small/#{format_string}.png"
      
      if options[:display_image] && image_formats.include?(format_string)
        return file.thumb('34x34#').url
      elsif File.exists?(vendor_images_path.join(icon_path))
        return icon_path
      end
    end
    nil
  end
end