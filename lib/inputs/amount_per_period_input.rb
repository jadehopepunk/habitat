class AmountPerPeriodInput < SimpleForm::Inputs::Base
  
  def input
    period_attribute_name = "#{attribute_name}_period".to_sym
    
    build_amount_field
  end
  
  private
  
    def build_amount_field
      defaults = {
        :as => :amount_with_unit}
      @builder.input_field(attribute_name, (options[:input_html] || {}).merge(defaults))
    end
end