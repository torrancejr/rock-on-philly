class VenuesController < ApplicationController
  # GET /venues
  def index
    @venues = Venue.all
  end
end
