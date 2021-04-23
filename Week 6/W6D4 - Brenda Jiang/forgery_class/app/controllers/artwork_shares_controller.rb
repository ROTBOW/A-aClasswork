class ArtworkSharesController < ApplicationController

    def create
        if ArtworkShare.new(share_params).save
            render plain: 'Congrats, you are seeing stuff'
        else
            render plain: 'Error yo'
        end
    end

    def destroy
        art = ArtworkShare.find(params[:id])
        if art.destroy
            render plain: 'I ain\'t seen nobody'
        else
            render plain: 'not even nobody'
        end
    end

    

    private

    def share_params
    params.permit(:viewer_id, :artwork_id)
    end
end
