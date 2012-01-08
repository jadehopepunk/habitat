class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.name
      t.datetime :created_at
    end
  end
end
