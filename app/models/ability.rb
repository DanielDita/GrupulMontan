class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :regular
      can :manage, Post
    else user.has_role? :visitor
      can :read, Post, user_id: user.id
    end

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :regular
      can :manage, Event
    else user.has_role? :visitor
      can :read, Event, user_id: user.id
    end

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :regular
      can :manage, Pin
    else user.has_role? :visitor
      can :read, Pin, user_id: user.id
    end
  end
end
