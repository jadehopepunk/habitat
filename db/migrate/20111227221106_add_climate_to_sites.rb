class AddClimateToSites < ActiveRecord::Migration
  def change
    add_column :sites, :climate_zone, :string
  end
end
