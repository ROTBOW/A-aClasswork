class AlbumsController < ApplicationController
    before_action :require_login

    def new
        @band = params[:band_id]
        @album = Album.new
        render :new
    end

    def create
        album = Album.new(album_params)
        if album.save
            redirect_to band_url(params[:album][:band_id])
        else
            flash[:errors] = album.errors.full_messages
            render :new
        end
    end

    def destroy
        album = Album.find_by(id: params[:id])
        band_id = album.band_id
        if album.destroy
            redirect_to band_url(band_id)
        end
    end

    private
    def album_params
        params.require(:album).permit(:title, :year, :band_id, :live_or_studio)
    end
end
