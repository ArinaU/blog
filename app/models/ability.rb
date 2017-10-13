class Ability
  include CanCan::Ability

    def initialize(user)    
      user ||= User.new
      if user.role? :editor
        can :read, :all
        can :create, Article
        can :create, Comment
        can :destroy, Article, user_id: user.id
      #  can :destroy, Comment, article_id: 
        can :update, Article, user_id: user.id
        can :update, Comment, user_id: user.id

      elsif user.role? :reader
        can :read, :all
        can :create, Comment
        can :update, Comment, user_id: user.id

      else
        can :read, Article

    end
  end
end

