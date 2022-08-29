# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
 
  protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |u|
          u.permit(:email, :password, :role_id,:technology_id, :password_confirmation)
        end
        devise_parameter_sanitizer.permit(:account_update) do |u|
          u.permit(:email, :password, :password_confirmation,:role_id,:technology_id)
        end
      end

      def after_sign_in_path_for(resource)
        if current_user.is_guest? 
          guests_guests_path
        elsif current_user.is_developer?
          developers_users_path
        elsif current_user.is_technical_lead?
          technical_leads_users_path
        elsif current_user.is_engineering_manager?
          engineering_managers_users_path
        elsif current_user.is_director_general?
          director_generals_users_path
        elsif current_user.is_admin?
          admins_users_path
        end
      end

      def user_root_path
          if current_user.is_admin?
            admins_users_path
          else
            developers_developers_path
          end
      end

      rescue_from CanCan::AccessDenied do |exception|
        if current_user.is_admin?
          redirect_to admins_users_path, alert: exception.message
        elsif current_user.is_technical_lead?
          redirect_to technical_leads_users_path, alert: exception.message
        elsif current_user.is_engineering_manager?
          redirect_to engineering_managers_users_path, alert: exception.message
        elsif current_user.is_director_general?
          redirect_to director_generals_users_path, alert: exception.message
        elsif current_user.is_developer?
          redirect_to developers_users_path, alert: exception.message
        else
          redirect_to guests_guests_path, alert: exception.message
        end
      end
end
