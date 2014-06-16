include CanCan::Ability

  def initialize(user)
    #user ||= User.new # guest user

    if get_role_for_current_user == 1
      can :all, User
      can :all, Admin
    end
    if get_role_for_current_user == 2
      can :edit, User
      can :show, User
      can :update, User
      can :destroy, User

      can :index, Admin
      can :edit, Admin
      can :show, Admin
      can :update, Admin
      can :destroy, Adnim
    end
    if get_role_for_current_user == 3
      can :edit, User
      can :show, User
      can :update, User
      cannot :destroy, User
      cannot :index, Admin
      cannot :edit, Admin
      cannot :show, Admin
      cannot :update, Admin
      cannot :destroy, Adnim
    end
end
