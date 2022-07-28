class Admins::ProjectsController < ApplicationController
   
    def index
        @projects=Project.all
    end

    def show
        @project=Project.find(params[:id])
    end

    def new
        @project=Project.new
    end

    def create
        @project=Project.new(project_params)
        if @project.save
            redirect_to [:admins,@project]
        else
            render :new
        end
    end

    def edit 
        @project=Project.find(params[:id])
    end

    def update
        @project=Project.find(params[:id])
        if @project.update(project_params)
            redirect_to [:admins,@project]
        else
            render :edit
        end
        
    end



    def destroy
        @project=Project.find(params[:id])

        if @project.destroy
        redirect_to admins_projects_path, alert: "book deleted", status: 303
        else
            render :index
        end

    end


    private

    def project_params
        params.require(:project).permit(:name,:description,:status,:server_email,:url,:server_password)
    end


end
