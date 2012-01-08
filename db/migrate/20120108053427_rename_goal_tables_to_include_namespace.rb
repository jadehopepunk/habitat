class RenameGoalTablesToIncludeNamespace < ActiveRecord::Migration
  def change
    rename_table :budget_goals, :goals_budget_items
    rename_table :labour_input_goals, :goals_labour_inputs
    rename_table :yield_goals, :goals_yields
  end
end
