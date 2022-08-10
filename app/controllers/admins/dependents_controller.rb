class Admins::DependentsController < ApplicationController
    def new
        @dependent=current_user.dependents.new
    end


    def create

        @dependent = Dependent.new(dependent_params)
        
        if @dependent.save
          redirect_to admins_users_path
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
        @dependent=Dependent.find(params[:id])
      end


      def update
        @dependent = Dependent.find(params[:id])
        if @dependent.update(dependent_params)
          redirect_to admins_users_path
        else
          render :edit
        end

      end

      def destroy
        @dependent=Dependent.find(params[:id])

        @dependent.destroy

        redirect_to admins_users_path
      end



    private

    def dependent_params
      params.require(:dependent).permit(:name, :phone, :residence_phone, :date_of_birth,:address, :cnic, :nationality, :action, :user_id)
    end
end
