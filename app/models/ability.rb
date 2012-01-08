class Ability
  include CanCan::Ability

  def initialize(user)
    goal_classes = [Goals::Yield, Goals::Feature, Goals::LabourInput, Goals::BudgetItem]
    
    if user
      if user.role == 'admin'
        can :manage, :all
      else
        can :manage, User, :id => user.id
        
        can [:read, :create], [Use, Job, ProjectCategory, Feature]

        can :create, Project
        can :manage, Project, :user_id => user.id
        can :manage, Brief, {:project => {:user_id => user.id}}

        can :manage, goal_classes, {:brief => {:project => {:user_id => user.id}}}
      end
    else
      can :read, Project, :is_public => true
      can :read, Brief, {:project => {:is_public => true}}
      can :read, goal_classes, {:brief => {:project => {:is_public => true}}}
    end
  end
end
