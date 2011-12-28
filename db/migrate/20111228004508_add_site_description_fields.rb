class AddSiteDescriptionFields < ActiveRecord::Migration
  def change
    add_column :sites, :soil_type, :text
    add_column :sites, :solar_aspect, :text
    add_column :sites, :weather_conditions, :text
    add_column :sites, :other_considerations, :text
  end
end
