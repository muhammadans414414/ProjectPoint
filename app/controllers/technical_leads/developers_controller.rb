class TechnicalLeads::DevelopersController < ApplicationController
    def index
        @developers = User.joins(:role).where('roles.name =?', 'developer')
      end
  
      def destroy
        @developer = User.find(params[:id])
  
      if @developer.destroy
          redirect_to technical_leads_developers_path, alert: 'Developer deleted', status: 303
      else
          render :index
      end
      end
end
