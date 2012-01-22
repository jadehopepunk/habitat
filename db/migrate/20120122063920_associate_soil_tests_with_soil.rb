class AssociateSoilTestsWithSoil < ActiveRecord::Migration
  def up
    add_column :soil_tests, :soil_id, :integer
    add_foreign_key :soil_tests, :soils
    
    SoilTest.all.each do |soil_test|
      site_id = soil_test.site_id
      site = Site.find(site_id)
      soil = site.default_soil
      if soil
        soil_test.update_attribute(:soil_id, soil.id)
      end
    end
    
    remove_foreign_key :soil_tests, :sites
    remove_column :soil_tests, :site_id
  end

  def down
    raise "can't be done"
  end
end
