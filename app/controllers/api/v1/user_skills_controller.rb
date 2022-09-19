class Api::V1::UserSkillsController < Api::ApplicationController
    def index
        render json:UserSkill.all
    end

    def create
        
        @user_skill=UserSkill.new(user_skill_params)
        if @user_skill.save
            render json:@user_skill
        else
            render json:@user_skill.errors
        end
    end

    def update
        
        @user_skill=UserSkill.new(user_skill_params)
        if @user_skill.update(user_skill_params)
            render json:@user_skill
        else
            render json:@user_skill.errors
        end
    end

    def destroy
        @user_skill=UserSkill.find(params[:id])
        if @user_skill.destroy
            render json:@user_skill
        else
            render json:@user_skill.errors
        end
    end

    private

    def user_skill_params
        params.require(:user_skill).permit(:user_id, :skill_id, :level)
    end

end