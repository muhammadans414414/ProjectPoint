class Admins::UserSkillsController < ApplicationController
    def new
        @user_skill=UserSkill.new
    end
    def create
        
        @user_skill=UserSkill.new(abc)
        @user_skill.user_id=current_user.id
        if @user_skill.save
            redirect_to admins_profile_details_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @user_skill=UserSkill.find(params[:id])
    end

    def update
        @user_skill=UserSkill.find(params[:id])
        
        if @user_skill.update(abc)
            redirect_to admins_profile_details_path
        else
            render :edit, status: :unprocessable_entity
        end
    end


    def destroy
        @user_skill=UserSkill.find(params[:id])
        @user_skill.destroy
        redirect_to admins_profile_details_path
    end


    private
    def abc
    params.require(:user_skill).permit!
    end


end
