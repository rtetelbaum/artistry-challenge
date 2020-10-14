class ArtistInstrumentsController < ApplicationController

	def new
		@artist_instruments = ArtistInstruments.new
		@artists = Artist.all
		@instruments = Instrument.all
	end

	def create
		@artist_instruments = ArtistInstruments.new(params.require(:artist_instruments).permit(:artist_id, :instrument_id))
		if @artist_instruments.save
			redirect_to artist_path(@artist_instruments.artist.id)
		else
			flash[:errors] = @artist_instruments.errors.full_messages
			redirect_to new_artist_instruments_path
		end
	end

end
