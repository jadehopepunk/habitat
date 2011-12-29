class LabourInputGoal < ActiveRecord::Base
  COMMON_TIME_UNITS = %w(day week month year decade century)

  belongs_to :job
  belongs_to :site
  
  validates_presence_of :job, :job_name
  validates_numericality_of :amount, :allow_blank => true, :greater_than => 0
  validates_inclusion_of :amount_unit, :in => %w(hour day)
  validates_inclusion_of :period, :in => COMMON_TIME_UNITS
  validates_inclusion_of :stage, :in => %w(mature implementation)
  
  def job_name
    job.name if job
  end
  
  def job_name=(value)
    self.job = (value.blank? ? nil : Job.find_or_initialize_by_name(value))
  end

  def amount_period_string
    [amount_string, period].reject(&:blank?).join(' per ')
  end

  def amount_string
    Unit.format_amount_and_unit(amount, amount_unit, :pluralize_unit => true)
  end
end
