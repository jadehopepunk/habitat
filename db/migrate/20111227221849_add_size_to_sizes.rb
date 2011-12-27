class AddSizeToSizes < ActiveRecord::Migration
  def change
    add_column :sites, :size, :float
    add_column :sites, :size_units, :string
  end
end
