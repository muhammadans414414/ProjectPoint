class ChangeUserToDeveloper < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role_id, :integer, default: Role.where(name:Developer).first.id
  end
end
