class SearchSkill
    prepend SimpleCommand
    include ApplicationHelper
    include ActiveModel::Validations
        
    def initialize(params)
      @data = params
      @results = []
    end
    attr_accessor :data, :results
    def call
      results = Skill.where(nil)
      filtering_params(data).each do |key, value|
        results = results.public_send("search_by_#{key}", value) if value.present?
      end
      results
    end
        
    def filtering_params(params)
      params.slice(:skill)
    end
  end
  