# frozen_string_literal: true
module Admins
  class DevelopersController < ApplicationController
  load_and_authorize_resource
    def index
     @developers = User.joins(:role).where("roles.name =?", "developer")
    end
    def destroy
      @developer = User.find(params[:id])
      if @developer.destroy
        redirect_to admins_developers_path, alert: "Developer deleted", status: 303
      else
        render :index
      end
    end
  end
end
