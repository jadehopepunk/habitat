class Goals::BudgetItem < ActiveRecord::Base
  belongs_to :brief
  belongs_to :budget_category
  
  can_assign_by_name :budget_category
  has_fixed_currency_money :amount

  delegate :project, :to => :brief, :allow_nil => true
  delegate :currency, :to => :project, :allow_nil => true

  validates_presence_of :brief, :budget_category_name
  validates_numericality_of :timeframe_amount, :allow_blank => true, :greater_than => 0
  validates_inclusion_of :timeframe_amount_unit, :in => Unit::CALENDAR_TIME_UNITS, :allow_blank => true
end
