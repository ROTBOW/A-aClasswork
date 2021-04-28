class SessionsController < ApplicationController
    before_action :require_logout, only: [:new, :create]
    before_action :require_login, only: [:destroy]

    def new
        render :new
    end

    def create
        user = User.find_by(user_name: params[:user][:user_name])
        if user.is_password?(params[:user][:password])
            session[:session_token] = user.reset_session_token!
            user.save!
            redirect_to cats_url
        else
            render :new
        end
    end

    def destroy
        logout_user!
        redirect_to new_session_url
    end

end
