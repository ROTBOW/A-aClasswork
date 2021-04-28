class SessionsController < ApplicationController
    before_action :require_logout, only: [:new, :create]
    before_action :require_login, only: [:destroy]


    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user
            login(user)
            redirect_to home_url
        else
            render :new
        end
    end

    def destroy
        logout(current_user)
        redirect_to home_url
    end
end
