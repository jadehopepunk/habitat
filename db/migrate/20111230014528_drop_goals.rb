class DropGoals < ActiveRecord::Migration
  def up
    drop_table :goals
  end

  def down
    create_table :goals do |t|
      t.references :site
      t.text :details
      t.timestamps
    end
  end
end
