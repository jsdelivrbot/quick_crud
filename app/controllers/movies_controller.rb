class MoviesController < ApplicationController

	def index
		@movies = Movie.all
	end
	
	def new
	end
	
	def create
		@movie = Movie.create(movie_params)
		if @movie.save
			redirect_to @movie
		else
			render 'new'
		end
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end
	
	def update
		@movie = Movie.find(params[:id])
		if @movie.update(movie_params)
			redirect_to @movie
		else
			render 'edit'
		end	
	end
	
	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		redirect_to movies_path	
	end



private

	def movie_params

		params.permit(:title, :year)

	end
end
