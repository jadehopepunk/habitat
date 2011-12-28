module NavigationHelper
  def render_breadcrumbs
    render_crumbs(
      :format => :html_list, 
      :ul_class => 'breadcrumb', 
      :active_li_class => 'active', 
      :separator => content_tag(:span, ' / ', :class => 'divider'), 
      :skip_if_blank => true).html_safe
  end
end