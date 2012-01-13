class ProjectCommunity < ActiveRecord::Base
  ACCESS_LEVELS = ['list', 'read', 'edit']
  
  belongs_to :project
  belongs_to :community
  
  validates_presence_of :community_name, :access

  can_assign_by_name :community
  
end
