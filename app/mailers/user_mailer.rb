class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = User.find(params[:id])
    @url  = new_user_session_path
    mail(to: @user.email, subject: 'Welcome to Our Awesome Site')
  end

  def new_review(review)
    @review = review
    mail(
    to: review.user.email,
    subject: "Thank you for the review on #{review.venue.name}"
    )
  end
end
