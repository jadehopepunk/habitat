class Goals::LabourInput < ActiveRecord::Base
  belongs_to :job
  belongs_to :brief
  
  validates_presence_of :job, :job_name, :brief
  validates_numericality_of :implementation_amount, :maintenance_amount, :allow_blank => true, :greater_than => 0
  validates_inclusion_of :implementation_amount_unit, :maintenance_amount_unit, :in => %w(hour day), :allow_blank => true
  validates_inclusion_of :implementation_amount_period, :maintenance_amount_period, :in => Unit::CALENDAR_TIME_UNITS, :allow_blank => true
  
  can_assign_by_name :job
  has_amount_with_period :prefix => :implementation, :pluralize_unit => true
  has_amount_with_period :prefix => :maintenance, :pluralize_unit => true
end
