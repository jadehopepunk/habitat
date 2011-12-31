class RemoveUnusedProjectFields < ActiveRecord::Migration
  def up
    remove_column :projects, :soil_type
    remove_column :projects, :solar_aspect
    remove_column :projects, :weather_conditions
    remove_column :projects, :other_considerations
  end

  def down
    add_column :projects, :soil_type, :text
    add_column :projects, :solar_aspect, :text
    add_column :projects, :weather_conditions, :text
    add_column :projects, :other_considerations, :text
  end
end
