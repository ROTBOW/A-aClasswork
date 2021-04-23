


class ArtworksController < ApplicationController

    # def index
    #     artworks = Artwork.where(artist_id: params[:user_id])
    #     if artworks
    #         render json: artworks
    #     end
    # end

    def index
        artworks = Artwork.left_outer_joins(:shared_viewers)
                            .where('users.id = ? OR artworks.artist_id = ?', params[:user_id], params[:user_id])
                            .select('artworks.*')
        # artwork  = Artwork.joins(:shared_viewers).select('artworks.*').where(artworks: {artist_id: params[:user_id]})
        # artworks = Artwork.
        render json: artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork, status: 200
        else
            render json: artwork.errors.full_messages, status: 400
        end
    end

    def show
        render json: Artwork.find(params[:id])
    end


    def destroy
        artwork = Artwork.find(params[:id])
        if artwork.destroy
            render plain: 'tis ded'
        else
            render plain: 'I can not be beat.'
        end
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 400
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :artist_id, :image_url)
    end

end