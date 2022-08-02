# frozen_string_literal: true

module Admins
  class UsersController < ApplicationController
    load_and_authorize_resource
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      debugger
      @user = User.new(user_params)
      if @user.save
        redirect_to admins_users_path
      else
        render :new
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admins_users_path
    end

    private

    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :role_id, :cell)
    end
  end
end
