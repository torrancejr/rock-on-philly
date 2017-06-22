class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @venue = Venue.find(params[:venue_id])
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @review = Review.new(review_params)
    @review.venue = @venue
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review added successfully"
      UserMailer.new_review(@review).deliver_now
      redirect_to venue_path(@venue)
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @venue = Venue.find(params[:venue_id])
    @review = Review.find(params[:id])
  end

  def destroy
    @venue = Venue.find(params[:venue_id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review deleted"
    redirect_to venue_path(@venue)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
