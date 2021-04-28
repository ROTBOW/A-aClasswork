class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    #CRRLLL
    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_login
        redirect_to home_url unless logged_in?
    end

    def require_logout
        redirect_to home_url if logged_in?
    end

    def logged_in?
        !!current_user
    end

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout(user)
        user.reset_session_token!
        session[:session_token] = nil
    end

end
