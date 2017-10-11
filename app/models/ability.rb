class Ability
  include CanCan::Ability

    def initialize(user)
        if user.editor?
           can :manage, :all
        elsif user.reader?
            can :read, :all 
            can :create, Comment
        else
            can :read, :all
        end
    end
end
