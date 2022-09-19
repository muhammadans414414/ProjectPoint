class EngineeringManagers::UsersController < ApplicationController
    load_and_authorize_resource
    def index
      @users = User.where("role_id<?",current_user.role.id)
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
          respond_to do |format|
            format.turbo_stream
            format.html {redirect_to engineering_managers_users_path, notice: "User was successfully created." }
          end
        else
          render :new,status: :unprocessable_entity
        end
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to engineering_managers_users_path
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :role_id,:technology_id)
    end
end
