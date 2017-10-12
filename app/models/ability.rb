class Ability
  include CanCan::Ability

    def initialize(user)
        
        if user && user.editor?
           can :manage, :all
        elsif user && user.reader?
            can :read, :all 
            can :create, Comment
        else
            can :read, :all
        end
    end
end
