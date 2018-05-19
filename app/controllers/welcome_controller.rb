class WelcomeController < ApplicationController
	def index
		@nome = 'Leonardo Camp'
		@eu = Pessoa.find_by id:(1)
	end
end