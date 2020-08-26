
class ApplicationController < ActiveRecord

    def current_user 
        @current_user = User.find_by_credentials(session_token: session[:session_token])
    end

    def ensure_logged_in?
        redirect_to new_session_url unless logged_in?
    end

    def login! #what it means to be logged in: a session token in your cookie matches a session token in your users table 
        session[:session_token] = user.reset_session_token 
        @current_user = user
    end

    def logout! 
        @current_user.reset_session_token!
        @current_user = nil 
        session[:session_token] = nil
    end

    def logged_in?
        !!current_user
    end

end