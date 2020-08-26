class PoemsController < ApplicationController

    before_action :ensure_logged_in?, only: [:index, :new, :create, :edit, :update]

    def index
        @poems = Poem.all
        render :index
    end

    def new 
        @poem = Poem.new
        render :new 
    end

    def edit  
        @poem = Poem.find(params[:id])
        render :edit 
    end

    def create
        @poem = current_user.poems.new(poem_params)

        if @poem.save
            redirect_to poems_url
        else
            flash[:errors] = @poem.errors.full_messages
            render :new
        end
    end

    def update
        @poem = Poem.find(params[:id])

        if current_user.id == @poem.author_id
            if @poem.update(poem_params)
                redirect_to poems_url 
            else 
                flash[:errors] = ["Something went wrong!"]
                render :edit
            end
        else 
            flash[:errors] = ["Something went wrong!"]
            redirect_to edit_poem_url(@poem.id)
        end
    end

    private 
    def poem_params
        params.require(:poem).permit(:title, :stanzas, :complete)
    end 

end
