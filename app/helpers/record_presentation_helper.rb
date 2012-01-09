module RecordPresentationHelper
  def attribute_row(record, key, options = {})
    unless record.send(key).blank?
      content_tag(:tr) do
        value = record.send(key)
        if options[:line_breaks]
          value = simple_format(value)
        end
        
        content_tag(:td, content_tag(:strong, options[:label] || key.to_s.humanize)) +
        content_tag(:td, value)
      end
    end
  end
  
  def table_link_footer(t, name, url, options = {})
    content_tag(:tfoot) do
      content_tag(:tr) do
        content_tag(:td, :colspan => t.table_fields.length, :class => 'table_actions') do
          link_to(name, url, options)
        end
      end
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
  
  def file_icon_link(file)
    if file
      link_to file.url, :class => 'file_link' do
        image_tag(file_icon_url(file.format), :class => 'file_icon', :alt => file.format)
      end
    end
  end
  
  def file_icon_url(format)
    vendor_images_path = Rails.root.join("vendor/assets/images")
    icon_path = "file-type-icons/file_icons/small/#{format.to_s}.png"
    if format && File.exists?(vendor_images_path.join(icon_path))
      icon_path
    else
      nil
    end
  end
  
end