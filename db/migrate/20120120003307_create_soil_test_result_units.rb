class CreateSoilTestResultUnits < ActiveRecord::Migration
  def change
    create_table :soil_test_result_units do |t|
      t.string :name
      t.datetime :created_at
    end
  end
end
