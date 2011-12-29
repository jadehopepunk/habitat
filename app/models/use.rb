class Use < ActiveRecord::Base
  has_many :yield_goals
  
  validates_presence_of :name
end
