class ActiveRecord::Base
  def self.has_amount_with_unit(options = {})
    prefix = options[:prefix].blank? ? '' : "#{options[:prefix]}_"
    amount_name_base = options[:name] || :amount
    amount_name = "#{prefix}#{amount_name_base}".to_sym
    unit_name = "#{amount_name}_unit".to_sym
    
    validates amount_name, :numericality => true, :allow_blank => true
    validates unit_name, :presence => {:if => amount_name}

    define_method("#{amount_name}_with_unit") do
      Unit.format_amount_and_unit(send(amount_name), send(unit_name), :pluralize_unit => options[:pluralize_unit])
    end
  end
end