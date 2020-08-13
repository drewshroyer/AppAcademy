class UsersController < ApplicationController

    def index
        if params.has_key?(:username)
            @users = User.where(username: params[:username])
        else
            @users = User.all
        end
        render json: @users
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
          else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show 
        @user = User.find(params[:id])
        render json: @user
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to users_url(@user)   # should be users_url not user_url like it shows in the notes 
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url(@user)
    end

    private 
    def user_params
        params
            .require(:user)
            .permit(:username, :email)
    end
end