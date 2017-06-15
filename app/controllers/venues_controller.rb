class VenuesController < ApplicationController
  # GET /venues
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @reviews = @venue.reviews
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
      flash[:notice]="Successfully created venue"
    else
      flash[:notice] = @venue.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :ages, :capacity, :website, :photo)
  end
end
