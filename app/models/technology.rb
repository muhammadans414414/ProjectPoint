class Technology < ApplicationRecord
    has_many :users
    def capitalize_name
        "#{name.capitalize}"
    end
end
