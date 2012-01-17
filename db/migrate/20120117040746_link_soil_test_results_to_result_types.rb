class LinkSoilTestResultsToResultTypes < ActiveRecord::Migration
  def up
    SoilTestResult.destroy_all
    add_column :soil_test_results, :soil_test_result_type_id, :integer
    remove_column :soil_test_results, :name
    
    add_foreign_key :soil_test_results, :soil_test_result_types, :column => 'soil_test_result_type_id'
  end

  def down
    add_column :soil_test_results, :name, :string
    remove_column :soil_test_results, :result_type_id    
  end
end
