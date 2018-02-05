class ActorsController < ApplicationController
	
	def index				# método que se utiliza para listar los actores según el archivo routes.rb
		@actors = Actor.all # se utiliza el nombre del model es decir Actor, y se guarda todo el registro en la variable @actors
	end

	def new
		@actors = Actor.new #método que se utiliza para crear un nuevo actor según archivo routes.rb
	end

	def create # método para guardar el registro en la base de datos llamando el método actors_params
		@actors = Actor.new(actors_params)
		if @actors.save
			redirect_to actors_path, notice: "El actor fué publicado con éxito"
		else
			render :new #para errores de validación
		end
		
	end

	private # método privado que se comunica con la base de datos
	def actors_params 
		params.require(:actor).permit(:name, :bio, :birth_date, :birth_place, :image_url, :alive, :death_date, :death_place)
	end
end
