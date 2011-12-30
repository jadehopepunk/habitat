class RenameSiteIdToProjectId < ActiveRecord::Migration
  def change
    rename_column :labour_input_goals, :site_id, :project_id
    rename_column :yield_goals, :site_id, :project_id
  end
end
