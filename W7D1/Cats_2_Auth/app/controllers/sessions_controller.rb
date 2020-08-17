class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        if user
            login!(user)
            user.reset_session_token!
            redirect_to cats_url
        else
            render :new, status: 422
        end
    end

    def destroy
        logout!
        redirect_to session_url
    end
    
end
