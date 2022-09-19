class AddLeadsIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :lead, null: false, foreign_key: true
  end
end
