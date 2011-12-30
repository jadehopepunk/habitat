class CreateLabourInputGoals < ActiveRecord::Migration
  def change
    create_table :labour_input_goals do |t|
      t.integer :job_id, :site_id
      t.float :implementation_amount
      t.string :implementation_amount_unit
      t.string :implementation_period
      t.float :maintenance_amount
      t.string :maintenance_amount_unit
      t.string :maintenance_period
      t.timestamps
    end
  end
end
