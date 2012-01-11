class CreateCollaboratorsForExistingUsers < ActiveRecord::Migration
  def up
    Project.all.each do |project|
      user = User.find(project.user_id)
      if user
        ProjectCollaborator.create(
          :project => project,
          :user => user,
          :project_role => 'owner'
        )
      end
    end
  end

  def down
    Project.all.each do |project|
      collaborator = ProjectCollaborator.where(:project_id => project.id, :project_role => 'owner').first
      user = collaborator.user
      project.user_id = user.id
      project.save!
    end
  end
end
