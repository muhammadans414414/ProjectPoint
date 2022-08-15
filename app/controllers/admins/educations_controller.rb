class Admins::EducationsController < ApplicationController

    def new
        @education=current_user.educations.new
    end


    def create

        @education = Education.new(education_params)
        
        if @education.save
          redirect_to admins_profile_details_path
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
        @education=Education.find(params[:id])
      end


      def update
        @education = Education.find(params[:id])
        if @education.update(education_params)
          redirect_to admins_profile_details_path
        else
          render :edit
        end

      end

      def destroy
        @education=Education.find(params[:id])

        @education.destroy

        redirect_to admins_profile_details_path
      end


    private

    def education_params
      params.require(:education).permit(:title, :major, :institute, :graduation_date,:user_id)
    end
end
