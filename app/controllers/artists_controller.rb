class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show update destroy]
  def index
    @artists = Artist.all
    render json: @artists
  end

  def show
    render json: @artist, include: :songs
  end

  def create
    @artist = Artist.new artist_params
    if @artist.save
      render json: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  def update
    if @artist.update artist_params
      render json: @artist
    else
      render json: @artist.errors
    end
  end

  def destroy
    @artist.destroy
  end

  private

  def set_artist
    @artist = Artist.find params[:id]
  end

  def artist_params
    params.require(:artist).permit(:name)
  end
end