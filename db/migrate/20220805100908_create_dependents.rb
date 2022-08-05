class CreateDependents < ActiveRecord::Migration[7.0]
  def change
    create_table :dependents do |t|
      t.string :name
      t.string :phone, null: false
      t.string :residence_phone, null: false
      t.date :date_of_birth
      t.text :address, null: false
      t.string :cnic
      t.string :nationality
      t.string :action
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
