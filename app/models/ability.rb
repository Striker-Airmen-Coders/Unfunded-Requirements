# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.hq_role?
      can :manage, :all
      can :access, :rails_admin
      can :manage, :dashboard  
    end
    if user.fma_role?
      can :manage, User, office: user.office  #can i specify if only FMA's wing == users.wing?
      can :access, :rails_admin
      can :manage, :dashboard  
      can :manage, Req, office: { name: user.office.name } 
    end
  end
end

