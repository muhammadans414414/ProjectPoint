class EmergencyContact < ApplicationRecord
  belongs_to :user
  enum relation: %i[Father Mother Brother Sister Wife Husband Friend ]
end
