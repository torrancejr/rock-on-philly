require "rails_helper"
require "pry"

feature "user sees all reviews for a venue" do
  scenario "user sees reviews for a specific venue" do
    user =
      User.create(
        first_name: "Meg",
        last_name: "Meg",
        email: "jarlax1@launchacademy.com",
        password: "testtest"
      )
    philamoca =
      Venue.create(
        name: "Philamoca",
        location: "531 N. 12th Street",
        ages: "All",
        capacity: 150,
        website: "http://www.philamoca.org/",
        photo: "philamoca.jpg"
      )
    review =
      Review.create(
        rating: 5,
        body: "Great venue for any show!",
        venue: philamoca,
        user: user
      )

    visit venue_path(philamoca)

    expect(page).to have_content review.body
  end
end
