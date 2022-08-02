# frozen_string_literal: true

class UserProject < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user_id, :project_id, presence: true
end
