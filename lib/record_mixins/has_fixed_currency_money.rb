class ActiveRecord::Base
  def self.has_fixed_currency_money(name)
    cents_name = "#{name}_cents".to_sym
    
    define_method(name) do
      Money.new(send(cents_name), currency) if send(cents_name) && currency
    end
    
    define_method("#{name}=") do |value|
      if value.respond_to?(:blank?) && value.blank?
        self.send("#{cents_name}=", nil)
      else
        as_money = value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money")
        self.send("#{cents_name}=", as_money.cents)
      end
    end
  end
end