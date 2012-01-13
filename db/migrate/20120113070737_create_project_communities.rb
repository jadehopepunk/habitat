class CreateProjectCommunities < ActiveRecord::Migration
  def change
    create_table :project_communities do |t|
      t.integer :project_id, :community_id
      t.string :access, :string, :length => 4
      t.timestamps
    end
  end
end
