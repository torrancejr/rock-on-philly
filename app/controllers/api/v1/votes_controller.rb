class Api::V1::VotesController < ApplicationController
  def create
    #Find Vote if exists
    #if the vote doesn't exist
    review = Review.find(params[:review_id])
    Vote.create(review: review, user: current_user, upvote: params[:vote])
    render json: { score: review.score }
    #if the vote does exist
      #if you clicked the thing that is already in the database
        #Destroy the vote
      #if they are different
        #Update the vote to the new boolean
  end
end
