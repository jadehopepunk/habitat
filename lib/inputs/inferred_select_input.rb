require 'unit'

class InferredSelectInput < SimpleForm::Inputs::Base
  
  def input
    inclusion_validator = inclusion_validators(attribute_name).first
    if inclusion_validator
      select_options = inclusion_validator.options[:in]
    else
      raise ArgumentError.new("Specifiy validates_inclusion_of on #{attribute_name.inspect} before using the AmountWithUnitInput.")
    end
    
    @builder.select(attribute_name, select_options, {:include_blank => true}, options[:input_html])
  end
  
  private
  
    def inclusion_validators(attribute_name)
      object.class.validators.select {|v| v.attributes.include?(attribute_name) && v.is_a?(ActiveModel::Validations::InclusionValidator)}
    end
  
end