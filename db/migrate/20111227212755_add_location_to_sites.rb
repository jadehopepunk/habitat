class AddLocationToSites < ActiveRecord::Migration
  def change
    add_column :sites, :address, :string
    add_column :sites, :lat, :float
    add_column :sites, :lng, :float
    add_column :sites, :gmaps, :boolean
  end
end
