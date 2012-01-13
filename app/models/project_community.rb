class ProjectCommunity < ActiveRecord::Base
  ACCESS_LEVELS = ['read', 'edit']
  
  belongs_to :project
  belongs_to :community

  can_assign_by_name :community
  
end
