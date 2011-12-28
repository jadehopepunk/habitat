class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :site
      t.text :details
      t.timestamps
    end
  end
end
