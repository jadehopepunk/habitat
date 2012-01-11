class CreateProjectCollaborators < ActiveRecord::Migration
  def change
    create_table :project_collaborators do |t|
      t.integer :project_id, :user_id
      t.string :project_role, :length => 30
      t.timestamps
    end
  end
end
