class Admins::EmergencyContactsController < ApplicationController
    def new
        @emergency_contact=current_user.emergency_contacts.new
    end


    def create

        @emergency_contact = EmergencyContact.new(emergency_contact_params)
        
        if @emergency_contact.save
          redirect_to admins_profile_details_path
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
        @emergency_contact=EmergencyContact.find(params[:id])
      end


      def update
        @emergency_contact = EmergencyContact.find(params[:id])
        if @emergency_contact.update(emergency_contact_params)
          redirect_to admins_profile_details_path
        else
          render :edit
        end

      end

      def destroy
        @emergency_contact=EmergencyContact.find(params[:id])

        @emergency_contact.destroy

        redirect_to admins_profile_details_path
      end




    private

    def emergency_contact_params
      params.require(:emergency_contact).permit(:name, :relation, :mobile,:user_id)
    end
end
