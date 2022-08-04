# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :manage, Project if user.is_admin?
    can :manage, UserProject if user.is_admin?
    can :manage, User if user.is_admin?
  end
end
