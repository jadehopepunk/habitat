class MoneyInput < SimpleForm::Inputs::Base
  def input
    defaults = {:class => 'small'}
    currency = object.currency
    input_field = @builder.input_field(attribute_name, defaults.merge(options[:input_html] || {}))
    add_on = "<span class=\"add-on\">#{currency.symbol}</span>"
    
    "<div class=\"input-prepend\">#{add_on}#{input_field}</div>"
  end
end