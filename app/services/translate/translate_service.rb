require 'rest-client'
require 'json'
require './app/services/translate/api_connection'

module TranslateModule
  class TranslateService
    def initialize(params, action)
      @from = 'pt'
      @to = 'en'
      @query = params['query']
    end

    def self.call
      translator.translate @query, from: "#{@from}", to: "#{@to}"
    end
  end
end
