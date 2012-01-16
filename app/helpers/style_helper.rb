module StyleHelper
  def top_available_heading(name)
    top_heading = (@top_heading || 1)
    content_tag("h#{top_heading}", name)
  end
end