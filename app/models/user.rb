# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :role
  has_one :personal_information
  has_one :contact_information
  has_many :emergency_contact
  has_many :educations
  has_many :dependents
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable, :lockable
  validates :fname, :lname, :email, :cell, presence: true
  def combined_name
    "#{fname} #{lname}"
  end

  def is_admin?
    self.role.name == Admin
  end

end
