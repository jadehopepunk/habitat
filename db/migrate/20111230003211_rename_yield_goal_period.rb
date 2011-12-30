class RenameYieldGoalPeriod < ActiveRecord::Migration
  def change
    rename_column :yield_goals, :period, :amount_period
  end
end
