class Admin::VenuesController < ApplicationController
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    flash[:notice] = "Successfully deleted venue"
    redirect_to venues_path
  end
end
