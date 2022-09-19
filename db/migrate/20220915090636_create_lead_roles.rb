class CreateLeadRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :lead_roles do |t|
      t.references :role, null: false, foreign_key: true
      t.references :lead, null: false, foreign_key: true

      t.timestamps
    end
  end
end
