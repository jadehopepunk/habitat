class CreateSoilTests < ActiveRecord::Migration
  def change
    create_table :soil_tests do |t|
      t.integer :project_id
      t.integer :area_id
      t.date :tested_on
      t.string :reference
      t.timestamps
    end
  end
end
