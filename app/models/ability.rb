# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    
      user ||= User.new # guest user (not logged in)
        debugger
        can :manage,Project if user.role.name==Admin
        can :manage,UserProject if user.role.name==Admin
        
      end
end
