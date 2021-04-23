


class UsersController < ApplicationController
    

    def index
        user = User.all
        render json: user
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render plain: 'Yall broke my website!!'
        end
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user.destroy
            render plain: 'Don\'t mess with my website!'
        else
            render plain: 'Hehehehe I did\'t mean it!!'
        end
    end

    def update
        user = User.find_by(id: params[:id])
        if user.update(user_params)
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end
