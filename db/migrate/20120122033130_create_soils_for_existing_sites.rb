class CreateSoilsForExistingSites < ActiveRecord::Migration
  def up
    Site.all.each do |site|
      if site.soils.empty?
        site.soils.create!(:name => 'Site Soil')
      end
    end
  end

  def down
    Soil.destroy_all
  end
end
