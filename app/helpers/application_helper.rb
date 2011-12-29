module ApplicationHelper
  def todo(message)
    content_tag(:p) do
      content_tag(:code, "TODO: #{message}")
    end
  end
end
