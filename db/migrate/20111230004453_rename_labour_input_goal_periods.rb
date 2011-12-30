class RenameLabourInputGoalPeriods < ActiveRecord::Migration
  def change
    rename_column :labour_input_goals, :implementation_period, :implementation_amount_period
    rename_column :labour_input_goals, :maintenance_period, :maintenance_amount_period
  end
end
