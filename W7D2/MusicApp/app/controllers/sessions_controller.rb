class SessionsController < ApplicationController

    def create 
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user
            login!(user)
            user.reset_session_token!
            redirect_to user_url(@user)
        else
            render :new, status: 422
        end
    end

    def destroy 
        logout!
        redirect_to session_url
    end

    def new
        render :new
    end

end