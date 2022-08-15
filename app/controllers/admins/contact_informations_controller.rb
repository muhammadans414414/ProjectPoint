class Admins::ContactInformationsController < ApplicationController
    def new
        @contact_information=ContactInformation.new
        
    end

    def create

        @contact_information = ContactInformation.new(contact_information_params)
        @contact_information.user_id=current_user.id
        if @contact_information.save
          redirect_to admins_profile_details_path
        else
          render :new, status: :unprocessable_entity
        end
      end

      def update
        @contact_information=ContactInformation.find(params[:id])
        if @contact_information.update(contact_information_params)
          redirect_to admins_profile_details_path
        else

        end
      end


    private

    def contact_information_params
      params.require(:contact_information).permit(:mobile, :residence_phone, :coordinator, :office_phone,:official_email, :personal_email, :residence_address, :permanent_address)
    end
end
