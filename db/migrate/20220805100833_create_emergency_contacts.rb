class CreateEmergencyContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :emergency_contacts do |t|
      t.string :name
      t.integer :relation
      t.string :mobile, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
