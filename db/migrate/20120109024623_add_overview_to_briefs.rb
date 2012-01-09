class AddOverviewToBriefs < ActiveRecord::Migration
  def change
    add_column :briefs, :description, :text
  end
end
