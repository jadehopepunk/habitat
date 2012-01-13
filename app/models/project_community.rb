class ProjectCommunity < ActiveRecord::Base
  ACCESS_LEVELS = ['list', 'read', 'edit']
  
  belongs_to :project
  belongs_to :community
  
  validates_presence_of :community_name, :access
  validates_uniqueness_of :community, :scope => :project_id

  can_assign_by_name :community
  
end
