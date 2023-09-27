class ArtworksController < ApplicationController
    def index
        artworks = Artwork.all
        render json: artworks
    end 

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

    def create
        artwork = Artwork.new(params.require(:artwork).permit(:title, :image_url, :artist_id))
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end 


    def show 
        artwork = Artwork.find(params[:id])
        render json: artwork
    end 

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            redirect_to artworks_url(artwork)
        else
            render artwork.errors.full_messages, status: :unprocessable_entity
        end
    end 

    def destroy 
        artwork = Artwork.find_by(id: params[:id])
        if artwork && artwork.destroy
            redirect_to artworks_url(artwork)
        else
            render json: { 'error': "artwork doesnt exist" }, status: 404
        end
    end 

end
