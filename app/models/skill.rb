class Skill < ApplicationRecord
    has_many :user_skills, dependent: :destroy
    has_many :users, through: :user_skills, dependent: :destroy
    validates :name,presence:true
    # scopes
    scope :search_by_skill, ->(data) {where(id: data)}
end
