class AddBloodGroupToPersonalInformations < ActiveRecord::Migration[7.0]
  def change
    add_column :personal_informations, :blood_group, :integer
  end
end
