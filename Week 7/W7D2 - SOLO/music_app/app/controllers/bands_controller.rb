class BandsController < ApplicationController
    before_action :require_login

    def new
      @band = Band.new
      render :new
    end

    def create
        band = Band.new(band_params)
        if band.save
            render :index
        else
            flash[:errors] = band.errors.full_messages
            render :new
        end
    end

    def destroy
        band = Band.find_by(id: params[:id])
        if band.destroy
          redirect_to home_url
        else
            render plain: 'and you broke it, this is from the destroy action in bands controller btw'
        end
    end

    def update
        band = Band.find_by(id: params[:id])
        if band.update(band_params)
            redirect_to band_url(band)
        end
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end

end
