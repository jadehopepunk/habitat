require 'unit'

class AmountWithUnitInput < SimpleForm::Inputs::Base
  
  def input
    unit_attribute_name = "#{attribute_name}_unit".to_sym

    unit_add_on = "<label class=\"add-on active\">#{build_unit_field(unit_attribute_name)}</label>"
    "<span class=\"input-append input-append-select\">#{build_amount_field}#{unit_add_on}</span>"
  end
  
  private
  
    def build_amount_field
      @builder.input_field(attribute_name, :class => :mini)
    end
    
    def build_unit_field(unit_attribute_name)
      defaults = {
        :as => :inferred_select, 
        :class => :mini,
        :label_processor => lambda {|value| Unit.format_unit(value)}
      }
      @builder.input_field(unit_attribute_name, (options[:input_html] || {}).merge(defaults))
    end
end