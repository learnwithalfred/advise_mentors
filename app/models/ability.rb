class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.admin?

    can :destroy, Post, user: user
    can :destroy, Comment, user:
  end
end
