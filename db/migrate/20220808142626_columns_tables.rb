class ColumnsTables < ActiveRecord::Migration[7.0]
  def change
    add_column :personal_informations, :profile_image, :string
  end
end
