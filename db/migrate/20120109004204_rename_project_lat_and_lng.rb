class RenameProjectLatAndLng < ActiveRecord::Migration
  def change
    remove_column :projects, :latitude
    remove_column :projects, :longitude
    rename_column :projects, :lat, :latitude
    rename_column :projects, :lng, :longitude
  end
  
  def down
    rename_column :projects, :latitude, :lat
    rename_column :projects, :longitude, :lng
  end
end
