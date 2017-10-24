class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
    render json: @artworks
  end

  def create
    # puts artwork_params
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    render json: @artwork
  rescue ActiveRecord::RecordNotFound
    render plain: "artwork does not exist", status: :unprocessable_entity
  end

  def update # (youll want to use ActiveRecord::Base#update)
    @artwork = Artwork.find(params[:id])
    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render plain: "artwork does not exist", status: :unprocessable_entity
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    if @artwork.destroy
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render plain: "artwork does not exist", status: :unprocessable_entity
  end


  private

  def artwork_params
    params.require(:artworks).permit(:title, :image_url, :artist_id)
  end
end
