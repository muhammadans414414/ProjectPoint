class DropContactInformationTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :contact_informations
  end
end
