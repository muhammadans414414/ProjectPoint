class Api::V1::DependentsController < Api::ApplicationController
    def index
        render json:Dependent.all
    end

    def create
        @dependent=Dependent.new(dependent_params)
        if @dependent.save
            render json:@dependent
        else
            render json:@dependent
         end
    end

    def destroy
        @dependent=Dependent.find(params[:id])
        if @dependent.destroy
            render json:Dependent.all
        else
            render json:@dependent.errors
        end
    end

    def update
        @dependent=Dependent.find(params[:id])
        if @dependent.update(dependent_params)
            render json:@dependent
        else
            render json:@dependent
         end
    end

    private

    def dependent_params
        params.require(:dependent).permit(:name,:phone,:residence_phone,:date_of_birth,:address,:cnic,:nationality,:action,:user_id)
    end

end