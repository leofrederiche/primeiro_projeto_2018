class PessoasController < ApplicationController
	def index
		@pessoas = Pessoa.all
	end

	def new
		@pessoa = Pessoa.new
	end

	def create
		@pessoa = Pessoa.create(params_pessoa)

		# Caso salve
		if @pessoa.save
			redirect_to pessoas_path
		else
			redirect_to root_path
		end
	end

	def edit
		@pessoa = Pessoa.find_by id: params[:id]
	end

	def update
		@pessoa = Pessoa.find_by id: params[:id]
		@pessoa.update_attributes(params_pessoa)

		if @pessoa.save
			redirect_to pessoas_path
		else
			redirect_to root_path
		end
	end

	def destroy
		@pessoa = Pessoa.find_by id: params[:id]

		# Verifica se consegue apagar
		if @pessoa.delete
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