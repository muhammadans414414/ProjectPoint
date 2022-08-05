class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.string :title, null: false
      t.string :major, null: false
      t.string :institute
      t.date :graduation_date, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
