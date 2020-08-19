class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def ensure_logged_in?
        redirect_to new_session_url unless logged_in?
    end

    def login!
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def logout!
        current_user.reset_session_token! #backend
        @current_user = nil     #for convience so you know that there is no logged in user 
        session[:session_token] = nil   #frontend
    end

    def logged_in?
        !!current_user
    end
end
