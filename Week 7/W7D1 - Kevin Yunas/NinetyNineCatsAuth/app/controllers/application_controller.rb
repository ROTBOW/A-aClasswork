class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @user ||= User.find_by(session_token: session[:session_token])
    end

    def login_user!
        user = User.find_by(id: params[:id])
        if user.is_password?(params[:password])
            session[:session_token] = user.reset_session_token!
            user.save!
            redirect_to cats_url
        else
            render :new
        end
    end

    def logout_user!
        current_user.reset_session_token! unless current_user.nil?
        session[:session_token] = nil 
        @user = nil
    end

    def logged_in?
        !!current_user
    end

    def require_login
        redirect_to new_session_url unless logged_in?
    end

    def require_logout
        redirect_to cats_url if logged_in?
    end

end
