class Api::V1::EducationsController < Api::ApplicationController
    def index
        render json:Education.all
    end

    def create
        @education=Education.new(education_params)
        if @education.save
            render json:@education
        else
            render json:@education
         end
    end

    def destroy
        @education=Education.find(params[:id])
        if @education.destroy
            render json:Education.all
        else
            render json:@education.errors
        end
    end

    def update
        @education=Education.find(params[:id])
        if @education.update(education_params)
            render json:@education
        else
            render json:@education
         end
    end

    private

    def education_params
        params.require(:education).permit(:title,:major,:institute,:user_id,:graduation_date)
    end

end