require 'rest-client'
require 'json'
require 'yandex-translator'

module TranslateModule
  class PluralService
    def initialize(params)
      @query = params['query']
      @translator = Yandex::Translator.new('trnsl.1.1.20170530T012157Z.f5eb0012e91de7d0.a183228fdbcba4e5e7b3c37c2cb9570cab192355')
    end

    def call
      response = @query.pluralize
      "*#{response}*"
    end
  end
end
