class AmountPerPeriodInput < SimpleForm::Inputs::Base
  
  def input
    "#{build_amount_field} <span class=\"per\">per</span> #{build_period_field}"
  end
  
  private
  
    def build_amount_field
      defaults = {:as => :amount_with_unit}
      @builder.input_field(attribute_name, (options[:input_html] || {}).merge(defaults))
    end
    
    def build_period_field
      period_attribute_name = "#{attribute_name}_period".to_sym
      defaults = {
        :as => :inferred_select,
        :class => 'small'
      }
      @builder.input_field(period_attribute_name, (options[:input_html] || {}).merge(defaults))
    end
end