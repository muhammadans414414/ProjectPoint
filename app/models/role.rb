# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :users, dependent: :destroy
  
  has_many :lead_roles, dependent: :destroy
  has_many :leads, through: :lead_roles, dependent: :destroy

  def capitalize_name
      "#{name}".capitalize()
  end

end
