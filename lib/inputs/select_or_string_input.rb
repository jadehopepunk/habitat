class SelectOrStringInput < SimpleForm::Inputs::Base
  def input
    build_select_field
  end
  
  private
  
    def build_select_field
      select_options = input_options.merge(:as => :select, :class => 'combo')
      @builder.input_field(attribute_name, select_options)
    end
end