class Brief < ActiveRecord::Base
  belongs_to :project

  has_many :yields, :dependent => :destroy, :class_name => 'Goals::Yield'
  has_many :labour_inputs, :dependent => :destroy, :class_name => 'Goals::LabourInput'
  has_many :budget_items, :dependent => :destroy, :class_name => 'Goals::BudgetItem'
  has_many :features, :dependent => :destroy, :class_name => 'Goals::Feature'
end
