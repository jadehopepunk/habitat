class RenameProjectLatAndLng < ActiveRecord::Migration
  def change
    rename_column :projects, :lat, :latitude
    rename_column :projects, :lng, :longitude
  end
end
