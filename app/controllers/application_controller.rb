# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |u|
          u.permit(:email, :password, :role_id, :password_confirmation)
        end
        devise_parameter_sanitizer.permit(:account_update) do |u|
          u.permit(:email, :password, :password_confirmation,:role_id)
        end
      end

      def after_sign_in_path_for(resource)
        if current_user.is_admin? 
          admins_users_path
        else
          developers_developers_path
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
        else
          redirect_to developers_developers_path, alert: exception.message
        end
      end
end
