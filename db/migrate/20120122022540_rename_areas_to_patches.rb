class RenameAreasToPatches < ActiveRecord::Migration
  def change
    rename_table :areas, :patches
  end
end
