class Education < ApplicationRecord
  belongs_to :user

  validates :title, :major, :institute, :graduation_date, presence: true
end
