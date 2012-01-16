class CreateNiches < ActiveRecord::Migration
  def change
    create_table :niches do |t|
      t.string :name
      t.text :description
      t.integer :parent_id, :project_id
      t.timestamps
    end
  end
end
