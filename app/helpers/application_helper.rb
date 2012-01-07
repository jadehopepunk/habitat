module ApplicationHelper
  def todo(message)
    if current_user
      content_tag(:p) do
        content_tag(:code, "TODO: #{message}")
      end
    end
  end
end
