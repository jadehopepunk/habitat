class RemoveParentIdFromAreas < ActiveRecord::Migration
  def up
    remove_column :areas, :parent_id
  end

  def down
    add_column :areas, :parent_id, :integer
  end
end
