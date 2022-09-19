class Api::V1::SkillsController < Api::ApplicationController
    def index
        render json:Skill.all
    end

    def create
        @skill=Skill.new(technology_params)
        if @skill.save
            render json:@skill
        else
            render json:@skill.errors
        end
    end

    def destroy
        @skill=Skill.find(params[:id])
        if @skill.destroy
            render json:Skill.all
        else
            render json:@skill.errors
        end
    end

    private

    def technology_params
        params.require(:skill).permit(:name)
    end
end