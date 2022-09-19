class DirectorGenerals::UsersController < ApplicationController
    load_and_authorize_resource
    def index      
        @users = User.all
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
          respond_to do |format|
            format.turbo_stream
            format.html {redirect_to director_generals_users_path, notice: "User was successfully created." }
          end
        else
          render :new,status: :unprocessable_entity
        end
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to director_generals_users_path
    end

    def get_users
      lead_id = params[:lead_id]
		if lead_id.present?
      lead=Lead.find(lead_id)
      roles=lead.roles
			render json: {status: true, data: roles.as_json}, status: 200
		else
			render json: {status: false, data: []}, status: 400
		end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :role_id,:technology_id,:lead_id)
    end
end
