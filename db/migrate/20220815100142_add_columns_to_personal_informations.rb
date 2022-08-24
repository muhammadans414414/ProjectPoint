class AddColumnsToPersonalInformations < ActiveRecord::Migration[7.0]
  def change
    add_column :personal_informations, :mobile, :string
    add_column :personal_informations, :residence_phone, :string
    add_column :personal_informations, :coordinator, :string
    add_column :personal_informations, :office_phone, :string
    add_column :personal_informations, :official_email, :string, null: false
    add_column :personal_informations, :personal_email, :string
    add_column :personal_informations, :residence_address, :text, null: false
    add_column :personal_informations, :permanent_address, :text
  end
end

