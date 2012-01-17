class CreateSitesAgain < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.integer :project_id
    end
    add_foreign_key :sites, :projects
  end
end
