class LeadRole < ApplicationRecord
  belongs_to :role
  belongs_to :lead
end
