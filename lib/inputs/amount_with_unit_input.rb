require 'unit'

class AmountWithUnitInput < SimpleForm::Inputs::Base
  
  def input
    @builder.template.content_tag(:div, :class => 'input-append input-append-select') do
      build_amount_field + build_unit_add_on
    end + @builder.error(unit_attribute_name, :error_prefix => 'unit')
  end
  
  def has_errors?
    super || !object.errors[unit_attribute_name].empty?
  end
  
  private
  
    def unit_attribute_name
      "#{attribute_name}_unit".to_sym
    end
  
    def build_amount_field
      @builder.input_field(attribute_name, :class => :mini)
    end
    
    def build_unit_add_on
      @builder.template.content_tag(:label, build_unit_field, :class => 'add-on active')
    end
    
    def build_unit_field
      defaults = {
        :as => :inferred_select, 
        :class => :mini,
        :label_processor => lambda {|value| Unit.format_unit(value)}
      }
      overrides = options[:unit_options] || {}
      unit_options = (options[:input_html] || {}).merge(defaults.merge(overrides))
      @builder.input_field(unit_attribute_name, unit_options)
    end
end