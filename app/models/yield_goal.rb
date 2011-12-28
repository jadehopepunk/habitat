class YieldGoal < ActiveRecord::Base
  belongs_to :site
  
  validates_presence_of :site
  validates_numericality_of :amount, :period, :lead_time_in_years, :allow_blank => true, :greater_than => 0
end
