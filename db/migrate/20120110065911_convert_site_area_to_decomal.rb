class ConvertSiteAreaToDecomal < ActiveRecord::Migration
  def up
    change_column :projects, :site_area, :decimal, :precision => 17, :scale => 3
  end

  def down
    change_column :projects, :site_area, :float
  end
end
