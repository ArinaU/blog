class Ability
  include CanCan::Ability

    def initialize(user)
        user ||= User.new
        if user.role? :editor
            can :manage, :all
        elsif user.role? :reader
            can :read, Article
        else
            can :read, Article
        end
    end
end

