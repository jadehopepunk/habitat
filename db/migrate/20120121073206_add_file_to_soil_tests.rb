class AddFileToSoilTests < ActiveRecord::Migration
  def change
    add_column :soil_tests, :file_uid, :string
    add_column :soil_tests, :file_name, :string
  end
end
