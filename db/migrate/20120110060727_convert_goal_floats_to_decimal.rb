class ConvertGoalFloatsToDecimal < ActiveRecord::Migration
  def up
    change_column :goals_labour_inputs, :implementation_amount, :decimal, :precision => 8, :scale => 2
    change_column :goals_labour_inputs, :maintenance_amount, :decimal, :precision => 8, :scale => 2
    change_column :goals_yields, :amount, :decimal, :precision => 8, :scale => 2
    change_column :goals_yields, :lead_time_in_years, :decimal, :precision => 8, :scale => 2
  end

  def down
    change_column :goals_labour_inputs, :implementation_amount, :float
    change_column :goals_labour_inputs, :maintenance_amount, :float
    change_column :goals_yields, :amount, :float
    change_column :goals_yields, :lead_time_in_years, :float
  end
end
