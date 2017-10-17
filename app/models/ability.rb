class Ability
  include CanCan::Ability

    def initialize(user)    
      user ||= User.new
      if user.role? :editor
        can [:read, :create], Article                                          # tested
        # cannot :read, @article => Comment
        can :read, Comment                                                     # tested
        can :create, Comment                                                   # tested
        can [:update, :destroy], Article, user_id: user.id                     # tested
        can :destroy, Comment do |comment|                                     # test fails
          comment.article_id == Article.find_by(user_id: user.id).id
        end
        can [:update, :destroy], Comment, user_id: user.id                     # tested

      elsif user.role? :reader
        can :read, Article                                                     # tested
        can :create, Comment                                                   # tested
        can [:update, :destroy], Comment, user_id: user.id                     # tested

      else
        can :read, Article

      end
  end
end

