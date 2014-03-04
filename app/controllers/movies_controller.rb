class MoviesController < ApplicationController

  def index
    @movies = Movie.currently_available
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
