class Api::V1::ProjectsController < Api::ApplicationController
    before_action :set_project, only: %i[ show update destroy ]
    def index
        render json: Project.all
    end

    def show
        render json: @project
    end

    def create
        @project=Project.new(project_params)
        if @project.save
            render json:{project:@project,code: 200, status: true, message: 'Project has been created Successfully'}
        else
            render json:{code: 1, status: false, message: 'Project not created'}
         end
    end

    def destroy
        if @project.destroy
            render json:Project.all
        else
            render json:@project.errors
        end
    end

    def update
        if @project.update(project_params)
            render json:@project
        else
            render json:@project.errors
        end
    end

    private

        def set_project
            begin
            @project=Project.find(params[:id])
            rescue
                render json:{code: 1, status: false, message: 'Project not exists with the given id'}
            end
        end

        def project_params
            params.require(:project).permit(:full_name, :short_name, :staging_url, :staging_test_username, :staging_test_password, :staging_database_name,
                                            :live_url, :live_test_username, :live_test_password, :live_database_name, :status, :ssh_url_ip)
        end
end 