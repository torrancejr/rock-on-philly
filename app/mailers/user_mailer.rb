class UserMailer < ApplicationMailer

  def new_review(review)
    @review = review
    mail(
    to: review.user.email,
    subject: "Thank you for the review on #{review.venue.name}"
    )
  end
end
