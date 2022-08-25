# frozen_string_literal: true
module Admins
  class UsersController < ApplicationController
    load_and_authorize_resource
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
        respond_to do |format|
          format.turbo_stream
          format.html {redirect_to admins_users_path, notice: "User was successfully created." }
        end
      else
        render :new,status: :unprocessable_entity
      end
    end
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admins_users_path
    end
    def searchuser
      if params[:data].empty? && params[:technology].empty?
        @users=User.all
      elsif params[:technology].empty? && !params[:data].empty?
        @users=User.where(role_id:params[:data])
      elsif !params[:technology].empty? && params[:data].empty?
        @users=User.where(technology_id: params[:technology]).where("role_id<?",current_user.role.id)
      else
        @users=User.where("role_id = ? AND technology_id = ?",params[:data],params[:technology])
      end
      respond_to do |format|
        format.js
        format.html {admins_users_path}
    end
    end
    def searchuser_by_technology
      if params[:data].empty? && params[:role].empty?
        @users=User.all
      elsif params[:role].empty? && !params[:data].empty?
        @users=User.where(technology_id:params[:data])
      elsif !params[:role].empty? && params[:data].empty?
        @users=User.where(role_id: params[:role])
      else
        @users=User.where("role_id = ? AND technology_id = ?",params[:role],params[:data])
      end
      respond_to do |format|
        format.js
        format.html {admins_users_path}
    end
    end
    def profile_details
      @emergency_contacts=current_user.emergency_contacts
      @educations=current_user.educations
      @dependents=current_user.dependents
      @personal_information=current_user.personal_information
      @user_skills=current_user.user_skills
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :role_id,:technology_id)
    end
  end
end
