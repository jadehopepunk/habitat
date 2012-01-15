class Ability
  include CanCan::Ability

  GOAL_CLASSES = [Goals::Yield, Goals::Feature, Goals::LabourInput, Goals::BudgetItem]

  def initialize(user)    
    if user
      if user.role == 'admin'
        admin_abilities
      else
        user_abilities(user)
      end
    else
      guest_abilities
    end
  end
  
  private
  
    def admin_abilities
      can :manage, :all
    end
    
    def guest_abilities
      can :read, Project, :is_public => true
      can :read, [Brief, Attachment], {:project => {:is_public => true}}
      can :read, GOAL_CLASSES, {:brief => {:project => {:is_public => true}}}
    end
    
    def user_abilities(user)
      guest_abilities
      base_user_abilities(user)
      user_project_abilities(user)
    end
    
    def base_user_abilities(user)
      can :manage, User, :id => user.id
      can [:read, :create], [Use, Job, ProjectCategory, Feature]
      can :create, Project
    end
    
    def user_project_abilities(user)
      user_project_collaborator_abilities(user)
      user_project_community_abilities(user)
    end
    
    def user_project_collaborator_abilities(user)
      owner_abilities(user)
      observer_abilities(user)
      participant_abilities(user)
    end
    
    def user_project_community_abilities(user)
      user_project_community_access_abilities(user, 'read', :read)
      user_project_community_access_abilities(user, 'edit', :edit)
    end
    
    def owner_abilities(user)
      project_role_abilities(user, 'owner', :manage, :manage)
    end
    
    def observer_abilities(user)
      project_role_abilities(user, 'observer', :read, :read)
    end
    
    def participant_abilities(user)
      project_role_abilities(user, 'participant', :read, :manage)
    end
    
    def design_consultant_abilities(user)
      project_role_abilities(user, 'design_consultant', :read, :read)
    end

    def user_project_community_access_abilities(user, community_access, action)
      user.communities.each do |community|
        user_project_community_access_abilities_for_community(community, user, community_access, action)
      end
    end
    
    def user_project_community_access_abilities_for_community(community, user, community_access, action)
      user_for_project = {:project_communities => {:community_id => community.id, :access => community_access}}
      user_for_project_component = {:project => user_for_project}

      can action, Project, user_for_project      
      can action, [Brief, Attachment], user_for_project_component
      can action, GOAL_CLASSES, {:brief => user_for_project_component}      
    end
    
    def project_role_abilities(user, project_role, project_action, goals_action)
      user_for_project = {:project_collaborators => {:user_id => user.id, :project_role => project_role}}
      user_for_project_component = {:project => user_for_project}

      can project_action, Project, user_for_project
      
      can goals_action, [Brief, Attachment], user_for_project_component
      can goals_action, GOAL_CLASSES, {:brief => user_for_project_component}
    end
end
