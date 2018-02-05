class ActorsController < ApplicationController
	def index
		@actors = Actor.all # se utiliza el nombre del model es decir Actor, y se guarda todo el registro en la variable @actors
	end
	def new
		@actors = Actor.new
	end
end
