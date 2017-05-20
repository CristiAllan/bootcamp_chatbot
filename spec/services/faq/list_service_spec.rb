require_relative './../../spec_helper.rb'

describe FaqModule::ListService do
	before do
		@company = create(:company)
	end

	describe '#call' do
		it 'with list command: With zero faqs, return dont find message' do
			@listService = FaqModule::ListService.new({}, 'list')

			response = @listService.call()
			expect(response).to match("Nada encontrado")
		end

		it 'with list command: with two faqs, find question and answer in response' do
			@listService = FaqModule::ListService.new({}, 'list')

			faq1 = create(:faq, company: @company)
			faq2 = create(:faq, company: @company)

			response = @listService.call()

			expect(response).to match(faq1.question)
			expect(response).to match(faq1.answer)

			expect(response).to match(faq2.question)
			expect(response).to match(faq2.answer)
		end

		it 'with search command: With empty query, return dont find message' do
			@listService = FaqModule::ListService.new({'query' => ''}, 'search')

			response = @listService.call()
			expect(response).to match("Nada encontrado")
		end

		it 'with search command: with valid query, find question and answer in response' do
			faq = create(:faq, company: @company)
			@listService = FaqModule::ListService.new({'query' => faq.question.split(" ").sample}, 'search')

			response = @listService.call()
			expect(response).to match(faq.question)
			expect(response).to match(faq.answer)

		end

		it 'with search_by_hashtag command: with invalid hashtag, return dont find message' do
			@listService = FaqModule::ListService.new({}, 'search_by_hashtag')

			response = @listService.call
			expect(response).to match("Nada encontrado")
		end

		it 'with search_by_hashtag command: with valid hashtag, find question and answer in response' do
			hashtag = create(:hashtag, company: @company)
			faq = create(:faq, company: @company)
			create(:faq_hashtag, faq: faq, hashtag: hashtag)

			#inserir na busca a hashtag criada
			@listService = FaqModule::ListService.new({'query' => hashtag.name}, 'search_by_hashtag')

			response = @listService.call()

			expect(response).to match(faq.question)
			expect(response).to match(faq.answer)
		end
	end
end