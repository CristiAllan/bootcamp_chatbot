require_relative './../../spec_helper.rb'

describe FaqModule::RemoveService do
  before do
    @company = create(:company)
  end

  it 'With valid id, remove faq' do
  	faq = create(:faq, company: @company)
  	@removeService = FaqModule::RemoveService.new({"id" => faq.id})

  	response = @removeService.call()
  	expect(response).to match("Deletado com sucesso")
  end

  it 'With valid id, remove faq from database' do
  	faq = create(:faq, company: @company)
  	@removeService = FaqModule::RemoveService.new({"id" => faq.id})

  	expect(Faq.all.count).to eq(1)
  	response = @removeService.call()
  	expect(Faq.all.count).to eq(0)
  end

  it 'With invalid id, receive error message' do
  	@removeService = FaqModule::RemoveService.new({"id" => rand(1..9999)})
  	response = @removeService.call()

  	expect(response).to match("Questão inválida, verifique o ID")
  end

end