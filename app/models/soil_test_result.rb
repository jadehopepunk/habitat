# encoding: utf-8

class SoilTestResult < ActiveRecord::Base
  RESULT_UNITS = ['pH Units', 'mg/L', 'me/100g', '%', 'g/mL', 'kg/ha', 'μg/g', 'units']
  belongs_to :soil_test
  
  validates_presence_of :name, :amount, :amount_unit
  validates_inclusion_of :amount_unit, :in => RESULT_UNITS, :allow_blank => true

  has_amount_with_unit
end
