class ProjectCollaborator < ActiveRecord::Base
  PROJECT_ROLES = ['owner', 'participant', 'observer', 'design consultant']
  
  belongs_to :project
  belongs_to :user
  
  validates_presence_of :user, :project_role
  validates_inclusion_of :project_role, :in => PROJECT_ROLES, :allow_blank => true
  validates_uniqueness_of :user_id, :scope => :project_id

  PROJECT_ROLES.each do |role|
    scope role.pluralize.underscore.to_sym, where(:project_role => role)
  end
  
  def initialize(*params)
    super
    self.project_role ||= 'participant'
  end
end
