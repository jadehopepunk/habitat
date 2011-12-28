module RecordPresentationHelper
  def attribute_row(record, key, options = {})
    unless record.send(key).blank?
      content_tag(:tr) do
        content_tag(:td, content_tag(:strong, options[:label] || key.to_s.humanize)) +
        content_tag(:td, record.send(key))
      end
    end
  end
end