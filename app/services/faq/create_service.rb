module FaqModule do
	class CreateService
		def initialize(params)
			@company = Company.last
			@question = params["question.original"]
			@answer = params["answer.original"]
			@hashtags = params["hashtags.original"]
		end

		def call
			return "Hashtag Obrigatória" if @hashtags == nil
			begin	
				Faq.transaction do
					faq = Faq.create(question: @question, answer: @answer, company: @company)
					@hashtags.split(/[\s,]+/).each do |hashtag|
						faq.hashtags << Hashtag.create(name: hashtag)
					end
				end
				"Criado com sucesso"
			rescue
				"Problemas na criação"
			end
		end
	end
end