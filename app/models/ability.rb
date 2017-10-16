class Ability
  include CanCan::Ability

    def initialize(user)    
      user ||= User.new
      if user.role? :editor
        can [:read, :create], Article
        cannot :read, @article => Comment
        can :create, Comment
        can [:update, :destroy], Article, user_id: user.id
        can :destroy, Comment do |comment|
          comment.article_id == Article.find_by(user_id: user.id).id
        end
        can [:update, :destroy], Comment, user_id: user.id

      elsif user.role? :reader
        can :read, Article
        can :create, Comment
        can [:update, :destroy], Comment, user_id: user.id

      else
        can :read, Article

      end
  end
end

