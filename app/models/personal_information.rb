class PersonalInformation < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image
  enum marital_status: %i[single married divorsed]
  enum religion: %i[Islam Hindu Christian Jewish Sikh]
  enum disability_type: %i[Physically_Disabled Visually_Impared Deaf Dump]

  def combined_name
      "#{first_name} #{last_name}"
  end

  validates :first_name,presence:true

end

