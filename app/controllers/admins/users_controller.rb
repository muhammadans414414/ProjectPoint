# frozen_string_literal: true

module Admins
  class UsersController < ApplicationController
    # load_and_authorize_resource
    def index
      @users = User.all
    end


    def edit
      @user=User.find(params[:id])
    end


    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admins_users_path
      else
        render :new
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admins_users_path
    end

    def searchuser
      @users=User.where(role_id:params[:data])
      
        respond_to do |format|
          format.js
          format.html {admins_users_path}
      end
    end


    def profile_details
      @data = User.joins(:role,:personal_information,:contact_information,:emergency_contacts,:educations,:dependents).select("*").where("users.id=?",current_user.id)
      @emergency_contacts=current_user.emergency_contacts
      @educations=current_user.educations
      @dependents=current_user.dependents
      @personal_information=current_user.personal_information
     
    end



    private

    def user_params
      params.require(:user).permit(:email, :password, :role_id)
    end
  end
end
