class RenamePeriodUnitToPeriod < ActiveRecord::Migration
  def change
    rename_column :yield_goals, :period_unit, :period
  end
end
