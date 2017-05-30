require_relative './../../spec_helper.rb'
require 'rest-client'
require 'json'

describe TranslateModule::TranslateService do
  it 'returns query translated' do
    @translate = TranslateModule::TranslateService.new({"query" => 'Teste'})
    response = @translate.call()

    expect(response).to match("Test")
  end
end
