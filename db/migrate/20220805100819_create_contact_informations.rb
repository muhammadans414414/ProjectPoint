class CreateContactInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_informations do |t|
      t.string :mobile, null: false
      t.string :residence_phone, null: false
      t.string :coordinator
      t.string :office_phone
      t.string :official_email, null: false
      t.string :personal_email, null: false
      t.text :residence_address, null: false
      t.text :permanent_address, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
