require 'unit'

class InferredSelectInput < SimpleForm::Inputs::Base
  
  def input
    inclusion_validator = inclusion_validators(attribute_name).first
    raise ArgumentError.new("Specifiy validates_inclusion_of on #{attribute_name.inspect} before using the AmountWithUnitInput.") unless inclusion_validator

    select_values = inclusion_validator.options[:in]
    label_processor = options[:label_processor]
    if label_processor
      select_options = select_values.map do |value|
        label_value = label_processor.call(value)
        [label_value, value]
      end
    else
      select_options = select_values
    end
    
    html_options = options[:input_html] || {}
    @builder.select(attribute_name, select_options, {:include_blank => true}, html_options)
  end
  
  private
  
    def inclusion_validators(attribute_name)
      object.class.validators.select {|v| v.attributes.include?(attribute_name) && v.is_a?(ActiveModel::Validations::InclusionValidator)}
    end
  
end