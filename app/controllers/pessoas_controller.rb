class PessoasController < ApplicationController
	def index
		@pessoas = Pessoa.all
	end

	def new
		@pessoa = Pessoa.new
	end

	def create
		@pessoa = Pessoa.create(params_pessoa)

		if @pessoa.save
			redirect_to pessoas_path
		else
			redirect_to root_path
		end
	end

	private
	def params_pessoa
		params.require(:pessoa).permit(:nome, :idade)
	end
end