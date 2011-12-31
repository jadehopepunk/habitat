class RenameProjectSizeFields < ActiveRecord::Migration
  def change
    rename_column :projects, :size, :site_area
    rename_column :projects, :size_units, :site_area_unit
  end
end
