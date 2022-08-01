class Developers::DevelopersController < ApplicationController

    def index
        @projects=current_user.user_projects.all
        
    end

end

