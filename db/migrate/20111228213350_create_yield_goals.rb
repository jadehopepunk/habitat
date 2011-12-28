class CreateYieldGoals < ActiveRecord::Migration
  def change
    create_table :yield_goals do |t|
      t.integer :use_id, :site_id
      t.float :amount
      t.string :amount_unit
      t.float :period
      t.string :period_unit
      t.float :lead_time_in_years
      t.text :details
      t.timestamps
    end
  end
end
