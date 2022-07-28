class Admins::UserProjectsController < ApplicationController
    load_and_authorize_resource
    def new
        @user_project=UserProject.new
    end
    def create
        @user_project=UserProject.new(user_project_params)
        if @user_project.save
            redirect_to admins_projects_path
        else
            render :new
        end
    end

    def details
        @projects=User.find(params[:id]).user_projects.all
        # debugger
    end


    def destroy
        @project=UserProject.find(params[:id])
        @project.destroy
        redirect_to admins_projects_path
       

    end

    private

    def user_project_params
        params.require(:user_project).permit(:user_id, :project_id)
    end

end
