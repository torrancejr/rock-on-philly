require 'rails_helper'

feature "visitors can add reviews for venues" do
  let!(:this_user) do
    User.create(
      first_name: "Meg",
      last_name: "Meg",
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
      user: this_user
    )
  end
  scenario "A user can edit their own review" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: this_user.email
    fill_in 'Password', with: this_user.password
    click_button 'Sign In'
    visit venue_path(philamoca)
    click_link "Edit Review"
    expect(page).to have_content "Review Form for Philamoca"

    fill_in "Rating", with: 3
    fill_in "Body", with: "This actually is less exciting than I thought!"
    click_button "Add Review"
    expect(page).to have_content "Review updated!"
    expect(page).to have_content philamoca.name
    expect(page).to have_content 3
    expect(page).to have_content "This actually is less exciting than I thought!"
  end

  scenario "A user cannot incorrectly edit their own review" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: this_user.email
    fill_in 'Password', with: this_user.password
    click_button 'Sign In'
    visit venue_path(philamoca)
    click_link "Edit Review"
    expect(page).to have_content "Review Form for Philamoca"

    fill_in "Rating", with: "hello"
    fill_in "Body", with: ""
    click_button "Add Review"
    expect(page).to_not have_content "Review updated!"
    expect(page).to have_content "Rating is not a number"
  end

  scenario "A user cannot edit another user's review" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Sign In'
    visit venue_path(philamoca)
    expect(page).to_not have_content("Edit Review")
  end
end
