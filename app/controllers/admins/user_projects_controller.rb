# frozen_string_literal: true

module Admins
  class UserProjectsController < ApplicationController
    # def new
    #   @user_project = UserProject.new
    #   authorize! :read, @user_project
    # end

    def create
     
      @user_project = UserProject.new(user_project_params)
      
      @data=UserProject.all
      @status=true
      @data.each do |record|
        if(record.user_id==@user_project.user_id && record.project_id==@user_project.project_id)
          @status=false
        end
      end
      
      if @status
        if @user_project.save
          redirect_to admins_projects_path
        else
          render :assigndeveloper
        end
      else
        redirect_to admins_projects_path, alert: "You have already assigned this project to this developer"
      end
    end

    def details
      @projects = User.find(params[:id]).user_projects.all
    end

    def assignprojects
      @user_project = User.find(params[:id]).user_projects.new
    end

    def assigndeveloper
      @user_project=Project.find(params[:id]).user_projects.new
    end

    def destroy
      @project = UserProject.find(params[:id])
      authorize! :read, @project
      @project.destroy
      redirect_to admins_projects_path
    end

    private

    def user_project_params
      params.require(:user_project).permit(:user_id,:project_id)
    end
  end
end
