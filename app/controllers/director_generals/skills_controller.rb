class DirectorGenerals::SkillsController < ApplicationController
    def index
        @skills=Skill.all
        
    end
    def new
        @skill=Skill.new
    end
    def create
        @skill=Skill.new(abc)
        if @skill.save
            respond_to do |format|
                format.turbo_stream
                format.html {redirect_to director_generals_skills_path, notice: "Skill was successfully created." }
              end
        else
            render :new, status: :unprocessable_entity
        end
    end
    def destroy
        @skill=Skill.find(params[:id])
        @skill.destroy
        redirect_to director_generals_skills_path
    end

    def skills_users
        @users=Skill.find(params[:id]).users
    end

    private
    def abc
    params.require(:skill).permit!
    end
end
