class RemoveProjectIdFromAlongsideBriefId < ActiveRecord::Migration
  def up
    [:goals_budget_items, :goals_features, :goals_labour_inputs, :goals_yields].each do |table|
      remove_column table, :project_id
    end
  end

  def down
    [:goals_budget_items, :goals_features, :goals_labour_inputs, :goals_yields].each do |table|
      add_column table, :project_id, :integer
    end
  end
end
