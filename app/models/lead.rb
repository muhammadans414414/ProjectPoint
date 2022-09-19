class Lead < ApplicationRecord
    
    has_many :users

    has_many :lead_roles, dependent: :destroy
    has_many :roles, through: :lead_roles, dependent: :destroy





    def capitalize_name
        "#{name}".capitalize()
    end
end
