class RenameGoalTablesToIncludeNamespace < ActiveRecord::Migration
  def change
    rename_table :budget_goals, :goals_budget_goals
    rename_table :labour_input_goals, :goals_labour_input_goals
    rename_table :yield_goals, :goals_yields
  end
end
