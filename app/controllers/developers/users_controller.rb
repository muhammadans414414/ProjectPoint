class Developers::UsersController < ApplicationController
    def index
        @users = User.where("role_id<?",current_user.role.id)
    end


    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to developers_users_path
        else
          render :new
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to developers_users_path
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :role_id,:technology_id)
    end
end