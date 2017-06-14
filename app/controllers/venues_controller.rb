class VenuesController < ApplicationController
  # GET /venues
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  private

  def venue_params
    params.require(:restaurant).permit(:name, :location, :ages,
                                      :capacity, :website, :photo
                                      )
  end
end
