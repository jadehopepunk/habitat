class YieldGoal < ActiveRecord::Base
  COMMON_VOLUME_UNITS = %w(m^3 L gal)
  COMMON_WEIGHT_UNITS = %w(kg lb)
  COMMON_TIME_UNITS = %w(week month year decade century)
  
  belongs_to :site
  belongs_to :use
  
  validates_presence_of :site, :use, :use_name
  validates_numericality_of :amount, :period, :lead_time_in_years, :allow_blank => true, :greater_than => 0
  validates_inclusion_of :amount_unit, :in => COMMON_VOLUME_UNITS + COMMON_WEIGHT_UNITS
  validates_inclusion_of :period_unit, :in => COMMON_TIME_UNITS
  
  def use_name
    use.name if use
  end
  
  def use_name=(value)
    self.use = (value.blank? ? nil : Use.find_or_initialize_by_name(value))
  end
  
  def amount_period_string
    [amount_string, period_string].reject(&:blank?).join(' per ')
  end
  
  def amount_string
    Unit.format_amount_and_unit(amount, amount_unit)
  end
  
  def period_string
    Unit.format_amount_and_unit(period, period_unit, :hide_one => true, :pluralize_unit => true)
  end
  
  def lead_time_string
    Unit.format_amount_and_unit(lead_time_in_years, 'year', :pluralize_unit => true)
  end
end