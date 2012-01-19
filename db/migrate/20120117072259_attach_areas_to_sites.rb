class AttachAreasToSites < ActiveRecord::Migration
  def up
    remove_foreign_key :areas, :projects
    rename_column :areas, :project_id, :site_id
    add_foreign_key :areas, :sites
  end

  def down
    remove_foreign_key :areas, :sites
    rename_column :areas, :site_id, :project_id
    add_foreign_key :areas, :projects
  end
end
