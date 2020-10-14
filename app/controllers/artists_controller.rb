class ArtistsController < ApplicationController

	def index
		@artists = Artist.all
	end

	def show
		@artist = Artist.find(params[:id])
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(params.require(:artist).permit(:name, :age, :title))
		if @artist.save
			redirect_to artist_path(@artist)
		else
			flash[:errors] = @artist.errors.full_messages
			redirect_to new_artist_path
		end
	end
	 
end
