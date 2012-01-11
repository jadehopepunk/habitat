class ProjectCollaborator < ActiveRecord::Base
  PROJECT_ROLES = ['owner', 'participant', 'observer', 'design consultant']
  
  belongs_to :project
  belongs_to :user
  
  validates_presence_of :project, :user, :project_role
  validates_inclusion_of :project_role, :in => PROJECT_ROLES, :allow_blank => true

  PROJECT_ROLES.each do |role|
    scope role.pluralize.underscore.to_sym, where(:project_role => role)
  end
end
