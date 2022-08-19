# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :role
  has_one :personal_information, dependent: :destroy
  has_many :emergency_contacts, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :dependents, dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects, dependent: :destroy

  belongs_to :technology
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
  
  
  # def combined_name
  #   "#{fname} #{lname}"
  # end

  def is_guest?
    role.name == Guest
  end

  def is_developer?
    role.name == Developer
  end

  def is_technical_lead?
    role.name == TechnicalLead
  end

  def is_engineering_manager?
    role.name == EngineeringManager
  end

  def is_director_general?
    role.name == DirectorGeneral
  end

  def is_admin?
    role.name == Admin
  end

  validates :email, :password,presence: true
  
end
