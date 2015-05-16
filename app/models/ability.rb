class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here.

    user ||= User.new # guest user (not logged in)


    if user.role? :administrator
      can :manage, :all
    else
      can :read, :all
    end

    if user.role? :user
      cannot :manage, Role
      cannot :manage, Device
      cannot :manage, User
    end

  end
end
