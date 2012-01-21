class AddMoreSoilTestFields < ActiveRecord::Migration
  def change
    add_column :soil_tests, :depth, :decimal, :precision => 8, :scale => 2
    add_column :soil_tests, :depth_unit, :string, :length => 10
    add_column :soil_tests, :number_of_samples, :integer
    add_column :soil_tests, :notes, :text
  end
end
