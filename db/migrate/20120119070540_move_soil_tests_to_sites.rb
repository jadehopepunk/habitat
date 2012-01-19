class MoveSoilTestsToSites < ActiveRecord::Migration
  def up
    remove_foreign_key :soil_tests, :projects
    rename_column :soil_tests, :project_id, :site_id
    add_foreign_key :soil_tests, :sites
  end

  def down
    remove_foreign_key :soil_tests, :sites
    rename_column :soil_tests, :site_id, :project_id
    add_foreign_key :soil_tests, :projects
  end
end
