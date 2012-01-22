class RenameAreaIdToPatchId < ActiveRecord::Migration
  def up
    remove_foreign_key :soil_tests, :name => :soil_tests_area_id_fk
    rename_column :soil_tests, :area_id, :patch_id
    add_foreign_key :soil_tests, :patches
  end

  def down
    remove_foreign_key :soil_tests, :name => :soil_tests_patch_id_fk
    rename_column :soil_tests, :patch_id, :area_id
    add_foreign_key :soil_tests, :areas
  end
end
