class CreateBriefIdsAlongsideProjectIds < ActiveRecord::Migration
  def change
    [:goals_budget_items, :goals_features, :goals_labour_inputs, :goals_yields].each do |table|
      add_column table, :brief_id, :integer
    end
  end
end
