class Api::V1::VotesController < ApplicationController
  def create
    #Find Vote if exists
    #if the vote doesn't exist
    review = Review.find(params[:review_id])
    @vote = Vote.where(user: current_user)
    if @vote.nil?
      Vote.create(review: review, user: current_user, upvote: params[:vote])
      render json: { score: review.score }
    else @vote.exists?
      Vote.update(review: review, user: current_user, upvote: params[:vote])
      render json: { score: review.score }
    end
  end
end
