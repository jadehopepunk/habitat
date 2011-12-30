class LabourInputGoal < ActiveRecord::Base
  belongs_to :job
  belongs_to :site
  
  validates_presence_of :job, :job_name
  validates_numericality_of :implementation_amount, :maintenance_amount, :allow_blank => true, :greater_than => 0
  validates_inclusion_of :implementation_amount_unit, :maintenance_amount_unit, :in => %w(hour day), :allow_blank => true
  validates_inclusion_of :implementation_amount_period, :maintenance_amount_period, :in => Unit::CALENDAR_TIME_UNITS, :allow_blank => true
  
  def job_name
    job.name if job
  end
  
  def job_name=(value)
    self.job = (value.blank? ? nil : Job.find_or_initialize_by_name(value))
  end

  def implementation_amount_period_string
    [implementation_amount_string, implementation_amount_period].reject(&:blank?).join(' per ')
  end

  def implementation_amount_string
    Unit.format_amount_and_unit(implementation_amount, implementation_amount_unit, :pluralize_unit => true)
  end

  def maintenance_amount_period_string
    [maintenance_amount_string, maintenance_amount_period].reject(&:blank?).join(' per ')
  end

  def maintenance_amount_string
    Unit.format_amount_and_unit(maintenance_amount, maintenance_amount_unit, :pluralize_unit => true)
  end

end
