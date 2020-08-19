class BandsController < ApplicationController

    def create
        @band = Band.new(bands_params)
        if @band.save
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def show
        @band = Band.find_by(id: params[:id])
        if @band
            render :show 
        else
            redirect_to bands_url
        end
    end

    def index
        @bands = Band.all
        render :index
    end

    def destroy 
        @band = Band.find(params[:id])
        @band.destroy 
        render :index
    end

    def edit 
        @band = Band.find(params[:id])
        render :edit
    end

    def new 
        @band = Band.new
        render :new
    end

    def update
        @band = Band.find(params[:id])
        if @band.update_attributes(bands_params)
          redirect_to cat_url(@band)
        else
          flash.now[:errors] = @band.errors.full_messages
          render :edit
        end
    end

    private
    def bands_params 
        params.require(:band).permit(:name)
    end

end