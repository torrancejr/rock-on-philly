class Api::V1::VenuesController < ApplicationController
  def index
    render json: {venues: Venue.all}
  end
end
