class RemoveGmapsColumnFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :gmaps
  end

  def down
    add_column :projects, :gmaps, :boolean
  end
end
