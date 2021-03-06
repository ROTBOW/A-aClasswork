class UsersController < ApplicationController
    before_action :require_login

    def create
        user = User.new(user_params)
        if user.save
            redirect_to users_url
        else
            flash[:errors] = user.errors.full_messages
            render :new
        end
    end

    def destroy
    end


    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
