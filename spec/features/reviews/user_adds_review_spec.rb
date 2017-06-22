require 'rails_helper'

feature "visitors can add reviews for venues" do
  let(:this_user) do
    User.create(
      first_name: "Meg",
      last_name: "Meg",
      email: "jarlax1@launchacademy.com",
      password: "testtest"
    )
  end
  let(:philamoca) do
    Venue.create(
      name: "Philamoca",
      location: "531 N. 12th Street",
      website: "http://www.philamoca.org/",
      photo: "philamoca.jpg"
    )
  end
  scenario "adds a review for a venue successfully" do
    ActionMailer::Base.deliveries.clear
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: "Meg"
    fill_in 'Last Name', with: "Meg"
    fill_in 'Email', with: "jarlax1@launchacademy.com"
    fill_in 'Password', with: "testtest"
    fill_in 'Password Confirmation', with: "testtest"

    click_button 'Sign Up'

    visit venue_path(philamoca)

    click_link "Add a Review"

    expect(page).to have_content "Review Form for Philamoca"

    fill_in "Rating", with: 5
    fill_in "Body", with: "This is a raving review!"
    click_button "Add Review"
    expect(page).to have_content "Review added successfully"
    expect(page).to have_content philamoca.name
    expect(page).to have_content 5
    expect(page).to have_content "This is a raving review!"
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "adds a review for a venue unsuccessfully" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: this_user.email
    fill_in 'Password', with: this_user.password
    click_button 'Sign In'

    visit venue_path(philamoca)

    click_link "Add a Review"
    expect(page).to have_content "Review Form for Philamoca"
    fill_in "Body", with: "ehhhh"
    click_button "Add Review"
    expect(page).to have_content "Rating can't be blank"
  end
end
