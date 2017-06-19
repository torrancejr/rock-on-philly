require 'rails_helper'

feature "User deletes review" do
  let(:admin) do
    User.create(
      first_name: "Admin",
      last_name: "Admin",
      email: "jarlax@launchacademy.com",
      password: "testtest",
      admin: true
    )
  end
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
  scenario "A user can delete their own review" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'
    visit venue_path(philamoca)
    click_link "Delete Review"
    expect(page).to have_content("Review deleted")
    expect(page).to_not have_content(review.body)
  end
  scenario "A user cannot delete another user's review" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Sign In'
    visit venue_path(philamoca)
    expect(page).to_not have_content("Delete Review")
  end
end
