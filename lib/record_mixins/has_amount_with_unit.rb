class ActiveRecord::Base
  def self.has_amount_with_unit(options = {})
    prefix = options[:prefix].blank? ? '' : "#{options[:prefix]}_"
    amount_name = options[:name] || :amount

    define_method("#{prefix}#{amount_name}_with_unit") do
      Unit.format_amount_and_unit(send("#{prefix}#{amount_name}"), send("#{prefix}#{amount_name}_unit"), :pluralize_unit => options[:pluralize_unit])
    end
  end
end