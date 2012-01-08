require 'unit'

class Goals::Yield < ActiveRecord::Base
  SPECIAL_USE_UNITS = %w(varieties)
  
  belongs_to :project
  belongs_to :use
  
  validates_presence_of :project, :use, :use_name
  validates_numericality_of :amount, :lead_time_in_years, :allow_blank => true, :greater_than => 0
  validates_inclusion_of :amount_unit, :in => Unit::COMMON_VOLUME_UNITS + Unit::COMMON_WEIGHT_UNITS + SPECIAL_USE_UNITS, :allow_blank => true
  validates_inclusion_of :amount_period, :in => Unit::CALENDAR_TIME_UNITS, :allow_blank => true

  can_assign_by_name :use
  has_amount_with_period
  
  def lead_time_string
    Unit.format_amount_and_unit(lead_time_in_years, 'year', :pluralize_unit => true)
  end
end
