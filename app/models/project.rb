class Project < ApplicationRecord
    has_many :user_projects, dependent: :destroy
    has_many :users, through: :user_projects, dependent: :destroy

    enum statuses: {inactive:"inactive",active:"active"}, _default: "inactive"

    # validations here

    validates :full_name, :short_name, :status, presence: true

end
