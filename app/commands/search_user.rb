class SearchUser
  prepend SimpleCommand
  include ApplicationHelper
  include ActiveModel::Validations
      
  def initialize(params)
    @data = params
    @results = []
  end
  attr_accessor :data, :results
  def call
    results = User.where(nil)
    debugger
    filtering_params(data).each do |key, value|
    results = results.public_send("search_by_#{key}", value) if value.present?
  end
    results
  end
      
  def filtering_params(params)
    params.slice(:role_id, :technology_id, :lead_id)
  end
end
