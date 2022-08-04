# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :role

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
