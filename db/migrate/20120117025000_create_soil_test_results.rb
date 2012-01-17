class CreateSoilTestResults < ActiveRecord::Migration
  def change
    create_table :soil_test_results do |t|
      t.integer :soil_test_id
      t.string :name
      t.decimal :amount, :precision => 15, :scale => 5
      t.string :amount_unit, :length => 20
      t.timestamps
    end
  end
end
