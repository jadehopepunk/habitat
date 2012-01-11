class Ability
  include CanCan::Ability

  def initialize(user)
    goal_classes = [Goals::Yield, Goals::Feature, Goals::LabourInput, Goals::BudgetItem]
    
    if user
      if user.role == 'admin'
        can :manage, :all
      else
        user_for_project = {:project_collaborators => {:user_id => user.id}}
        user_for_project_component = {:project => user_for_project}
        
        can :manage, User, :id => user.id
        
        can [:read, :create], [Use, Job, ProjectCategory, Feature]

        can :create, Project
        can :manage, Project, user_for_project
        can :manage, [Brief, Attachment], user_for_project_component

        can :manage, goal_classes, {:brief => user_for_project_component}
      end
    else
      can :read, Project, :is_public => true
      can :read, [Brief, Attachment], {:project => {:is_public => true}}
      can :read, goal_classes, {:brief => {:project => {:is_public => true}}}
    end
  end
end
