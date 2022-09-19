# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :trackable, :validatable,
                    :confirmable
            include DeviseTokenAuth::Concerns::User
        
  has_one_attached :profile_image
  belongs_to :role
  belongs_to :lead
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

  # devise send emails using aysncronous approach
  def send_devise_notification(notification, *args)
    Devise::Mailer.send(notification, self, *args).deliver_later
  end

  #scopes
  scope :search_by_role_id, ->(data) { where(role_id: data)}
  scope :search_by_technology_id,->(data){ where(technology_id: data) }
  scope :search_by_lead_id,->(data){ where(lead_id: data) }
  
  # checking prevelidge level
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

end
