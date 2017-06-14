class VenuesController < ApplicationController
  # GET /venues
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end
end
