class StringWithAddOnInput < SimpleForm::Inputs::Base  
  def input
    input_field = @builder.input_field(attribute_name, options[:input_html])
    suffix_add_on = "<span class=\"add-on\"><span>#{options[:suffix]}</span>"
    
    "<div class=\"input-append\">#{input_field}#{suffix_add_on}</div>"
  end
end