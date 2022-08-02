# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :full_name
      t.string :short_name
      t.text :staging_url
      t.string :staging_test_username
      t.string :staging_test_password
      t.string :staging_database_name
      t.text :live_url
      t.string :live_test_username
      t.string :live_test_password
      t.string :live_database_name
      t.string :status
      t.text :ssh_url_ip

      t.timestamps
    end
  end
end
