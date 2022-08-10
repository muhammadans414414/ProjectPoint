class RemoveUserColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :fname, :string
    remove_column :users, :lname, :string
    remove_column :users, :profile_image, :string
    remove_column :users, :cell, :string
  end
end
