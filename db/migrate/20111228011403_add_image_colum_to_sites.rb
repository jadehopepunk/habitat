class AddImageColumToSites < ActiveRecord::Migration
  def change
    add_column :sites, :photo_uid, :string
  end
end
