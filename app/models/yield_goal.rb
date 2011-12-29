class YieldGoal < ActiveRecord::Base
  COMMON_VOLUME_UNITS = %w(m^3 L gal)
  COMMON_WEIGHT_UNITS = %w(kg lb)
  
  belongs_to :site
  
  validates_presence_of :site
  validates_numericality_of :amount, :period, :lead_time_in_years, :allow_blank => true, :greater_than => 0
  validates_inclusion_of :amount_unit, :in => COMMON_VOLUME_UNITS + COMMON_WEIGHT_UNITS
end
