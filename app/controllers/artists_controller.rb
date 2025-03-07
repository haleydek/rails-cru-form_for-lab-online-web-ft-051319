class ArtistsController < ApplicationController
    before_action :set_artist, only: [:edit, :update, :show]

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    def edit
    end

    def update
        @artist.update(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    def show
    end

    private
    
    def set_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params(*args)
        params.require(:artist).permit(:name, :bio)
    end
end