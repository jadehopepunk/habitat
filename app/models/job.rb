class Job < ActiveRecord::Base
  has_many :labour_input_goals
  
  validates_presence_of :name
end
