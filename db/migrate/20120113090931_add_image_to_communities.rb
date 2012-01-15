class AddImageToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :photo_uid, :string
  end
end
