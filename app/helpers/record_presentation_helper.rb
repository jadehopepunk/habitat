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
end