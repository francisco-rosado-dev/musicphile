class GenresController < ApplicationController
  before_action :set_genre, only: %i[show update destroy]
  def index
    @genres = Genre.all
    render json: @genres
  end

  def show
    render json: @genre
  end

  def create
    @genre = Genre.new genre_params
    if @genre.save
      render json: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  def update
    if @genre.update genre_params
      render json: @genre
    else
      render json: @genre.errors
    end
  end

  def destroy
    @genre.destroy
  end

  private

  def set_genre
    @genre = Genre.find params[:id]
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end