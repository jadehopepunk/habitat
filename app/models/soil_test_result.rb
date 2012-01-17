class SoilTestResult < ActiveRecord::Base
  belongs_to :soil_test
  
  validates_presence_of :name, :amount, :amount_unit
end
