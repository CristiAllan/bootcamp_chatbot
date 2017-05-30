require_relative './../../spec_helper.rb'
require 'rest-client'
require 'json'

describe TranslateModule::TranslateService do
  it 'returns query translated' do
    @plural = TranslateModule::PluralService.new({"query" => 'People'})
    response = @plural.call()

    expect(response).to match("People")
  end
end
