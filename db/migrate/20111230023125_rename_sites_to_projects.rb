class RenameSitesToProjects < ActiveRecord::Migration
  def change
    rename_table :sites, :projects
  end
end
