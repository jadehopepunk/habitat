class BudgetGoal < ActiveRecord::Base
  belongs_to :project
  belongs_to :budget_category
  
  validates_presence_of :project, :budget_category_name
  validates_numericality_of :timeframe_amount, :allow_blank => true, :greater_than => 0
  validates_inclusion_of :timeframe_amount_unit, :in => Unit::CALENDAR_TIME_UNITS, :allow_blank => true

  composed_of :amount,
    :class_name => "Money",
    :mapping => [%w(amount_cents cents), %w(currency currency_as_string)],
    :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
    
  can_assign_by_name :budget_category
  
  delegate :currency, :to => :project, :allow_nil => true
  
  def amount
    Money.new(amount_cents, currency) if amount_cents && currency
  end
  
  def amount=(value)
    if value.respond_to?(:blank?) && value.blank?
      self.amount_cents = nil
    else
      as_money = value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money")
      self.amount_cents = as_money.cents
    end
  end
end
