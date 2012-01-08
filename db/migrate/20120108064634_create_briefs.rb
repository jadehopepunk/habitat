class CreateBriefs < ActiveRecord::Migration
  def change
    create_table :briefs do |t|
      t.integer :project_id
      t.timestamps
    end
  end
end
