class EngineeringManagers::DevelopersController < ApplicationController
    def index
        @developers = User.joins(:role).where('roles.name =?', 'developer')
        authorize! :read, @developers if !current_user.is_engineering_manager?
      end
      def destroy
        @developer = User.find(params[:id])
      if @developer.destroy
        redirect_to engineering_managers_developers_path, alert: 'Developer deleted', status: 303
      else
        render :index
      end
      end
end
