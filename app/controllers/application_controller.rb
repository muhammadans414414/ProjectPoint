class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fname, :lname, :email, :password, :role_id, :password_confirmation, :profile_image, :cell) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:fname, :lname, :email, :password, :password_confirmation, :profile_image, :cell, :role_id, :current_password) }
    end

    def after_sign_in_path_for(resource)
        if current_user.role.name == Admin 
            admins_users_path
        else
            developers_developers_path
        end
       
    end


    rescue_from CanCan::AccessDenied do | exception |
        redirect_to root_url, alert: exception.message
      end

     

end
