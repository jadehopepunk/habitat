module ProjectHelper
  def project_link(project)
    if can?(:read, project)
      link_to project.name, project
    else
      content_tag(:span, project.name)
    end
  end
  
  def project_access_level(project)
    if can?(:edit, project)
      'editable'
    elsif can?(:read, project)
      'readable'
    else
      'private'
    end
  end  
end