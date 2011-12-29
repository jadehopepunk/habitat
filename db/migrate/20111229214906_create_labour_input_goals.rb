class CreateLabourInputGoals < ActiveRecord::Migration
  def change
    create_table :labour_input_goals do |t|
      t.integer :job_id
      t.float :amount
      t.string :amount_unit
      t.string :period
      t.string :stage, :default => 'mature'
      t.timestamps
    end
  end
end
