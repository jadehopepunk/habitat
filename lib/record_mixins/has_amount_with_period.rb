class ActiveRecord::Base
  def self.has_amount_with_period(options = {})
    prefix = options[:prefix].blank? ? '' : "#{options[:prefix]}_"

    define_method("#{prefix}amount_with_period") do
      [send("#{prefix}amount_with_unit"), send("#{prefix}amount_period")].reject(&:blank?).join(' per ')
    end
    
    define_method("#{prefix}amount_with_unit") do
      Unit.format_amount_and_unit(send("#{prefix}amount"), send("#{prefix}amount_unit"), :pluralize_unit => options[:pluralize_unit])
    end
  end
end