class EngineeringManagers::ProjectsController < ApplicationController
    def index
        @projects = Project.all
  
        respond_to do |format|
          format.xlsx
          format.html { render :index }
          format.pdf do
            render pdf: "Projects #{@projects.count}", template: 'engineering_managers/projects/index', formats: [:html]
          end
        end
      end
  
      def show
        @project = Project.find(params[:id])
        respond_to do |format|
          format.html
          format.pdf do
            render pdf: "Project_#{@project.id}", template: 'engineering_managers/projects/projects', formats: [:html]
          end
        end
      end
  
      def new
        @project = Project.new
      end
  
      def create
        @project = Project.new(project_params)
        if @project.save
          redirect_to [:engineering_managers, @project]
        else
          render :new
        end
      end
  
      def edit
        @project = Project.find(params[:id])
      end
  
      def update
        @project = Project.find(params[:id])
        if @project.update(project_params)
          redirect_to [:engineering_managers, @project]
        else
          render :edit
        end
      end
  
      def destroy
        @project = Project.find(params[:id])
  
        if @project.destroy
          redirect_to engineering_managers_projects_path, alert: 'Project deleted', status: 303
        else
          render :index
        end
      end
  
      def project_users
        @users=Project.find(params[:id]).user_projects.all
      end
  
  
      def searchproject
        if (params[:data].empty?)
        @projects=Project.all
        else
          @projects=Project.where(status:params[:data])
          respond_to do |format|
            format.js
            format.html {root_path}
        end
        end
  
      
      end
  
      private
      def project_params
        params.require(:project).permit(:full_name, :short_name, :staging_url, :staging_test_username, :staging_test_password, :staging_database_name,
                                        :live_url, :live_test_username, :live_test_password, :live_database_name, :status, :ssh_url_ip)
      end
end
