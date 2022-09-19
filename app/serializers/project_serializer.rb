class ProjectSerializer < ActiveModel::Serializer
  attributes :id,:full_name, :short_name, :staging_url, :staging_test_username, :staging_test_password, :staging_database_name,
  :live_url, :live_test_username, :live_test_password, :live_database_name, :status, :ssh_url_ip
  
end
