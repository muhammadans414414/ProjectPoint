class Api::V1::RolesController < Api::ApplicationController
    def index
        render json:Role.all
    end

    def create
        @role=Role.new(role_params)
        if @role.save
            render json:@role
        else
            render json:@role.errors
        end
    end

    def destroy
        @role=Role.find(params[:id])
        if @role.destroy
            render json:Role.all
        else
            render json:@role.errors
        end
    end

    private

    def role_params
        params.require(:role).permit(:name)
    end
end