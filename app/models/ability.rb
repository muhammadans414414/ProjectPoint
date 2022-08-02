# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :manage, Project if user.role.name == Admin
    can :manage, UserProject if user.role.name == Admin
    can :manage, User if user.role.name == Admin
  end
end
