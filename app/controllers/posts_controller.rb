class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create]
  def index
    # @movies = Movie.all
  end

  # def new
  #   @movie = Movie.new
  # end

  # def create
  #   @movie = Movie.create(movies_params)
  #   @movie.save!
  #   redirect_to movies_path
  # end

  # private

  # def movies_params
  #   params.require(:movie).permit(:title, :year)
  # end

end