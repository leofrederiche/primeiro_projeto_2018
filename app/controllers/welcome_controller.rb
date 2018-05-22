class WelcomeController < ApplicationController
	def index
		@nome = Pessoa.last.nome
		@eu = Pessoa.first
	end
end