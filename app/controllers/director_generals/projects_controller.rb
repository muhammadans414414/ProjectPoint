class DirectorGenerals::ProjectsController < ApplicationController
  load_and_authorize_resource
    def index
        @projects = Project.all
        respond_to do |format|
          format.xlsx
          format.html { render :index }
          format.pdf do
            render pdf: "Projects #{@projects.count}", template: 'director_generals/projects/index', formats: [:html]
          end
        end
      end
      def show
        @project = Project.find(params[:id])
        respond_to do |format|
          format.html
          format.pdf do
            render pdf: "Project_#{@project.id}", template: 'director_generals/projects/projects', formats: [:html]
          end
        end
      end
      def new
        @project = Project.new
      end
      def create
        @project = Project.new(project_params)
        if @project.save
          redirect_to [:director_generals, @project]
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
          redirect_to [:director_generals, @project]
        else
          render :edit
        end
      end
      def destroy
        @project = Project.find(params[:id])
        if @project.destroy
          redirect_to director_generals_projects_path, alert: 'Project deleted', status: 303
        else
          render :index
        end
      end
      def project_users
        @users=Project.find(params[:id]).user_projects.all
      end
      def searchproject
        @command=SearchProject.call(params)
        respond_to do |format|
          format.js
        end
      end
  
      private
      def project_params
        params.require(:project).permit(:full_name, :short_name, :staging_url, :staging_test_username, :staging_test_password, :staging_database_name,
                                        :live_url, :live_test_username, :live_test_password, :live_database_name, :status, :ssh_url_ip)
      end
end
