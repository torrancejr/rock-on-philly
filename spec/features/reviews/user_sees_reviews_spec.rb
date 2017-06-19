require "rails_helper"

feature "user sees all reviews for a venue" do
  let!(:user1) do
    User.create(
      first_name: "Meg",
      last_name: "Conroy",
      email: "jarlax1@launchacademy.com",
      password: "testtest"
    )
  end
  let!(:user2) do
    User.create(
      first_name: "Chris",
      last_name: "Ryan",
      email: "chrisryan@launchacademy.com",
      password: "testtest"
    )
  end
  let!(:philamoca) do
    Venue.create(
      name: "Philamoca",
      location: "531 N. 12th Street",
      website: "http://www.philamoca.org/",
      photo: "philamoca.jpg"
    )
  end
  let!(:review) do
    Review.create(
      rating: 5,
      body: "Great venue for any show!",
      venue: philamoca,
      user: user1
    )
  end

  scenario "user sees reviews for a specific venue" do

    visit venue_path(philamoca)

    expect(page).to have_content review.rating
    expect(page).to have_content review.body
    expect(page).to have_content review.created_at.strftime("%B %d %Y")
  end

  scenario "does not see other reviews for other venues" do
    union_transfer =
      Venue.create(
        name: "Union Transfer",
        location: "1026 Spring Garden Street
    ",
        website: "http://www.utphilly.com/",
        photo: "uniontransfer.jpg"
      )
    review_for_philamoca =
      Review.create(
        rating: 5,
        body: "Great venue for any show!",
        venue: philamoca,
        user: user1
      )
    review_for_union_transfer =
      Review.create(
        rating: 3,
        body: "Okay, kinda crowded",
        venue: union_transfer,
        user: user2
      )
    visit venue_path(philamoca)

    expect(page).to have_content philamoca.name
    expect(page).to have_content review_for_philamoca.body

    expect(page).not_to have_content union_transfer.name
    expect(page).not_to have_content review_for_union_transfer.body
  end
end
