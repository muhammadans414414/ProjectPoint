# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects, dependent: :destroy
  enum statuses: { inactive: 'inactive', active: 'active' }, _default: 'inactive'
  validates :full_name, :short_name, :status, presence: true
end
