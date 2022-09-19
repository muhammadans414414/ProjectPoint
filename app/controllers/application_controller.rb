# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :null_session, if: -> { request.format.json? }

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

      def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password,:role_id,:technology_id,:lead_id])
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
