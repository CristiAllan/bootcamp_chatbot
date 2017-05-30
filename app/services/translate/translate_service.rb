require 'rest-client'
require 'json'
require 'yandex-translator'

module TranslateModule
  class TranslateService
    def initialize(params)
      @from = 'pt'
      @to = 'en'
      @query = params['query']
      @translator = Yandex::Translator.new('trnsl.1.1.20170530T012157Z.f5eb0012e91de7d0.a183228fdbcba4e5e7b3c37c2cb9570cab192355')
    end

    def call
      translate = @translator.translate @query, from: @from, to: @to
      "A tradução de #{@query} em inglês é #{translate}"
    end
  end
end
