class BudgetCategory < ActiveRecord::Base
  has_many :budget_items, :class_name => "Goals::BudgetItem"
  
  validates_presence_of :name
end
