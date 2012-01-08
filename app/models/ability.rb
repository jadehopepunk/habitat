class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.role == 'admin'
        can :manage, :all
      else
        can :manage, User, :id => user.id
        
        can [:read, :create], [Use, Job, ProjectCategory]

        can :create, Project
        can :manage, Project, :user_id => user.id
        can :manage, Brief, {:project => {:user_id => user.id}}

        can :manage, [Goals::Yield, Goals::LabourInput, Goals::BudgetItem], {:brief => {:project => {:user_id => user.id}}}
      end
    else
      can :read, Project, :is_public => true
      can :read, Brief, {:project => {:is_public => true}}
      can :read, [Goals::Yield, Goals::LabourInput, Goals::BudgetItem], {:brief => {:project => {:is_public => true}}}
    end
  end
end
