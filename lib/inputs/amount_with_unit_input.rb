require 'unit'

class AmountWithUnitInput < SimpleForm::Inputs::Base
  
  def input
    unit_attribute_name = "#{attribute_name}_unit".to_sym

    inclusion_validator = inclusion_validators(unit_attribute_name).first
    if inclusion_validator
      options = format_units(inclusion_validator.options[:in])
    else
      raise ArgumentError.new("Specifiy validates_inclusion_of on #{unit_attribute_name.inspect} before using the AmountWithUnitInput.")
    end
    
    amount_field = @builder.input_field(attribute_name, :class => :mini)
    unit_field = @builder.select(unit_attribute_name, options, {}, :class => :mini)
    unit_add_on = "<label class=\"add-on active\">#{unit_field}</label>"
    "<div class=\"input-append input-append-select\">#{amount_field}#{unit_add_on}</div>"
  end
  
  private
  
    def format_units(units)
      units.map do |value|
        [Unit.format_unit(value), value]
      end
    end
      
    def inclusion_validators(attribute_name)
      object.class.validators.select {|v| v.attributes.include?(attribute_name) && v.is_a?(ActiveModel::Validations::InclusionValidator)}
    end
end