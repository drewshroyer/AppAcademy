class ArtworksController < ApplicationController

    def index  #refactor this to showcase the other nested index that we just created 
        if params.has_key?(:user_id)
            user = User.find(params[:user_id])
            @artworks = user.artworks + user.shared_artworks   
        else
            @artworks = Artwork.all 
        end
        render json: @artworks
    end

    # def index 
    #     Artwork
    #     .left_outer_joins(:artwork_shares)
    #     .where("artworks.artist_id = #{params[:user_id]} OR artwork_shares.viewer_id = #{params[:user_id]}").distinct
    # end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
          else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show 
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])

        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)   
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to artworks_url(@artwork)
    end

    private 
    def artwork_params
        params
            .require(:artwork)
            .permit(:title, :artist_id, :image_url)
    end
end