class CreateSoilTestResultTypes < ActiveRecord::Migration
  def change
    create_table :soil_test_result_types do |t|
      t.string :name
      t.datetime :created_at
    end
  end
end
