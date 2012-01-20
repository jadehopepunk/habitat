# encoding: utf-8

class SoilTestResult < ActiveRecord::Base
  belongs_to :soil_test
  belongs_to :soil_test_result_type
  belongs_to :soil_test_result_unit
  
  validates_presence_of :name, :amount, :amount_unit

  has_amount_with_unit
  can_assign_by_name :soil_test_result_type
  can_assign_by_name :soil_test_result_unit

  attr_writer :name, :amount_unit
  attr_accessor :name_comboHidden, :amount_unit_comboHidden
  
  alias_method :name_combo, :soil_test_result_type_name
  alias_method :name, :soil_test_result_type_name
  alias_method :name_combo=, :soil_test_result_type_name=
  alias_method :amount_unit, :soil_test_result_unit_name
  alias_method :amount_unit_combo, :soil_test_result_unit_name
  alias_method :amount_unit_combo=, :soil_test_result_unit_name=
end
