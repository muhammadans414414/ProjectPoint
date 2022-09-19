class Api::V1::EmergencyContactsController < Api::ApplicationController
    def index
        render json:EmergencyContact.all
    end

    def create
        @emergency_contact=EmergencyContact.new(emergency_contact_params)
        if @emergency_contact.save
            render json:@emergency_contact
        else
            render json:@emergency_contact
         end
    end

    def destroy
        @emergency_contact=EmergencyContact.find(params[:id])
        if @emergency_contact.destroy
            render json:EmergencyContact.all
        else
            render json:@emergency_contact.errors
        end
    end

    def update
        @emergency_contact=EmergencyContact.find(params[:id])
        if @emergency_contact.update(emergency_contact_params)
            render json:@emergency_contact
        else
            render json:@emergency_contact
         end
    end

    private

    def emergency_contact_params
        params.require(:emergency_contact).permit(:name,:relation,:mobile,:user_id)
    end

end