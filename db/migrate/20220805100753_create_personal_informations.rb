class CreatePersonalInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_informations do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :father_name, null: false
      t.date :date_of_birth
      t.integer :marital_status
      t.string :spouse_name
      t.integer :religion
      t.string :cnic, null: false
      t.date :cnic_expiry_date
      t.boolean :disability, null: false, default: false
      t.string :designation, null: false
      t.string :employee_code, null: false
      t.string :place_of_birth
      t.string :domicile
      t.string :nationality
      t.string :passport_number
      t.date :passport_validity_date
      t.string :height
      t.references :user, null: false, foreign_key: true
      t.integer :disability_type

      t.timestamps
    end
  end
end
