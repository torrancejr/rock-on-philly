class ReviewsController < ApplicationController

  private
  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
