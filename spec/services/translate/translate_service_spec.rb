require_relative './../../spec_helper.rb'

describe TranslateModule::TranslateService do
  it 'returns a json content' do
    value = TranslateModule::TranslateService.call

    expect(response).to have_http_status(200)
  end
end
