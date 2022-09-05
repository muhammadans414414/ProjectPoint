# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects, dependent: :destroy
  enum statuses: { Inactive: 'inactive', Active: 'active' }, _default: 'inactive'
  validates :full_name, :short_name, :status, presence: true

  def capitalized_name
    "#{full_name}".capitalize
  end

end
