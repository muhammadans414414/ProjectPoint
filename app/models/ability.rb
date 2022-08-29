# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    # can :manage, UserProject if user.is_admin?
    can :manage, User if user.is_admin? || user.is_director_general? || user.is_engineering_manager? || user.is_technical_lead? || user.is_developer?
    can :manage, Project if user.is_admin? || user.is_director_general? || user.is_engineering_manager? || user.is_technical_lead?
    can :manage, Skill if user.is_admin? || user.is_director_general? || user.is_engineering_manager? || user.is_technical_lead?
  end
end
