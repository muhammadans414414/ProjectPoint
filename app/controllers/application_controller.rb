class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fname, :lname, :email, :password, :role_id, :password_confirmation, :profile_image, :cell) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:fname, :lname, :email, :password, :password_confirmation, :profile_image, :cell, :current_password, :role_id) }
    end

    def after_sign_in_path_for(resource)
        if current_user.role.name == Admin 
            admins_admins_path
        else
            developers_developers_path
        end
       
    end

    # def after_update_path_for(resource)
    #     if current_user.role.name == Admin 
    #         admins_admins_path
    #     else
    #         developers_developers_path
    #     end
       
    # end

end
