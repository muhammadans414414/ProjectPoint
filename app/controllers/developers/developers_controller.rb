# frozen_string_literal: true

module Developers
  class DevelopersController < ApplicationController
    def index
      @projects = current_user.user_projects.all
      authorize! :read, @projects if !current_user.is_developer?
    end
    def show
      @project=UserProject.find(params[:id])
    end
  end
end
