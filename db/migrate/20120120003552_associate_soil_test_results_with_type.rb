class AssociateSoilTestResultsWithType < ActiveRecord::Migration
  def up
    SoilTestResult.destroy_all
    add_column :soil_test_results, :soil_test_result_unit_id, :integer
    remove_column :soil_test_results, :amount_unit
    
    add_foreign_key :soil_test_results, :soil_test_result_units, :column => 'soil_test_result_unit_id'
  end

  def down
    add_column :soil_test_results, :amount_unit, :string
    remove_column :soil_test_results, :soil_test_result_unit_id    
  end
end
