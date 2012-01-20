class SelectOrStringInput < SimpleForm::Inputs::Base
  def input
    build_select_field + add_another_label + build_string_field
  end
  
  private
  
    def add_another_label
      @builder.template.content_tag(:div, "or add another", :class => 'add_another')
    end

    def build_select_field
      select_options = input_options.merge(:as => :select)
      @builder.input_field(attribute_name, select_options)
    end
    
    def build_string_field
      "<input type=\"text\" name=\"fish\" />".html_safe
    end
    
end