class Use < ActiveRecord::Base
  has_many :yield_goals, :class_name => 'Goals::Yield'
  
  validates_presence_of :name
end
