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
      owner_abilities(user)
      observer_abilities(user)
    end
    
    def owner_abilities(user)
      project_role_abilities(user, 'owner', :manage)
    end
    
    def observer_abilities(user)
      project_role_abilities(user, 'observer', :read)
    end
    
    def project_role_abilities(user, project_role, action)
      user_for_project = {:project_collaborators => {:user_id => user.id, :project_role => project_role}}
      user_for_project_component = {:project => user_for_project}

      can action, Project, user_for_project
      can action, [Brief, Attachment], user_for_project_component
      can action, GOAL_CLASSES, {:brief => user_for_project_component}
    end
end
