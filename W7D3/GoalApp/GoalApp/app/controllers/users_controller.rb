class UsersController  < ApplicationController

    def index 
        @users = User.all 
        render :index
    end

    def show 
        @user = User.find(params[:id])
        render :show
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            render :show
        else 
            redirect_to users_url
        end
    end

    private 
    def user_params 
        params.require(:user).permit(:username, :password)
    end
end