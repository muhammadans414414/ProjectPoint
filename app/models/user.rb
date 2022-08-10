# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :role
  has_one :personal_information, dependent: :destroy
  has_one :contact_information, dependent: :destroy
  has_many :emergency_contacts, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :dependents, dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable, :lockable

  # def combined_name
  #   "#{fname} #{lname}"
  # end

  def is_admin?
    self.role.name == Admin
  end

end
