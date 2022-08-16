class Admins::PersonalInformationsController < ApplicationController
    def new
        @personal_information=PersonalInformation.new
    end
    def create
        debugger
        @personal_information=PersonalInformation.new(personal_information_params)
        @personal_information.user_id=current_user.id
        if @personal_information.save
            redirect_to admins_profile_details_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @personal_information=PersonalInformation.find(params[:id])
        debugger
        if @personal_information.update(personal_information_params)
            redirect_to admins_profile_details_path
        else
            puts "error"
        end
    end



    private
    def personal_information_params
    params.require(:personal_information).permit!
    end


end
