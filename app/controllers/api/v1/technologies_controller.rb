class Api::V1::TechnologiesController < Api::ApplicationController
    def index
        render json:Technology.all
    end

    def create
        @technology=Technology.new(technology_params)
        if @technology.save
            render json:@technology
        else
            render json:@technology.errors
        end
    end

    def destroy
        @technology=Technology.find(params[:id])
        if @technology.destroy
            render json:Technology.all
        else
            render json:@technology.errors
        end
    end

    private

    def technology_params
        params.require(:technology).permit(:name)
    end
end