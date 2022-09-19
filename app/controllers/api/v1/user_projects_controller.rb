class Api::V1::UserProjectsController < Api::ApplicationController
    def index
        render json:UserProject.all
    end

    def create
        @user_project=UserProject.new(user_project_params)
        if @user_project.save
            render json:@user_project
        else
            render json:@user_project.errors
        end
    end

    def destroy
        @user_project=UserProject.find(params[:id])
        if @user_project.destroy
            render json:UserProject.all
        else
            render json:@user_project.errors
        end
    end


    private

    def user_project_params
        params.require(:user_project).permit(:user_id,:project_id)
    end
end