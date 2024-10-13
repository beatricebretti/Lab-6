class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Allow everyone to read posts that are published (published: "published")
    can :read, Post, published: "published"

    if user.persisted? 
      can :create, Post
      can :create, Comment
      # Allow users to manage (edit, update, destroy) their own posts
      can [:edit, :update, :destroy], Post, user_id: user.id

      # Allow users to manage (create, edit, destroy) their own comments
      can [:edit, :destroy], Comment, user_id: user.id
    end
  end
end
