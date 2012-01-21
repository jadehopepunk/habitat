class CreateSoils < ActiveRecord::Migration
  def change
    create_table :soils do |t|
      t.integer :site_id
      t.string :name
      t.string :wrb98_code
      t.text :description
      t.timestamps
    end
    add_foreign_key :soils, :sites
  end
end
