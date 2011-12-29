class RemovePeriodFromYieldGoals < ActiveRecord::Migration
  def up
    remove_column :yield_goals, :period
  end

  def down
    add_column :yield_goals, :period, :float
  end
end
