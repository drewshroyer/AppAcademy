class GoalsController  < ApplicationController
 
    def index 
        @goals = Goal.all 
        render :index
    end

    def show 
        @goal = Goal.find(params[:id])
        render :show
    end

    def create 
        @goal = Goal.new(goals_params)
        if @goal.save 
            render :show
        else 
            redirect_to goals_url
        end
    end

    private 
    def goals_params 
        params.require(:goal).permit(:name, :user_id)
    end
end

