class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :role



  mount_uploader :profile_image, ProfileImageUploader

  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects, dependent: :destroy


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable, :lockable

  validates :fname, :lname, :email, :cell, presence: true


  def combined_name
    "#{self.fname} #{self.lname}"
  end

end
