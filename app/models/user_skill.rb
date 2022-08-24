class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  enum level: %i[Beginner Medium Expert]
end
