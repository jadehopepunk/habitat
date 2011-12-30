class BudgetCategory < ActiveRecord::Base
  has_many :budget_goals
  
  validates_presence_of :name
end
