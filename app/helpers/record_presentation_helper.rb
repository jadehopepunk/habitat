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
end