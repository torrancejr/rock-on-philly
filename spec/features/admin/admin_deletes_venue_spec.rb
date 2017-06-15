require "rails_helper"

feature "Admin deletes a venue" do
  let(:admin) do
    User.create(
      first_name: "Admin",
      last_name: "Meg",
      email: "jarlax@launchacademy.com",
      password: "testtest",
      admin: true
    )
  end
  let!(:user1) do
    User.create(
      first_name: "Meg",
      last_name: "Meg",
      email: "jarlax1@launchacademy.com",
      password: "testtest"
    )
  end
  let!(:philamoca) do
    Venue.create(
      name: "Philamoca",
      location: "531 N. 12th Street",
      ages: "All",
      capacity: 150,
      website: "http://www.philamoca.org/",
      photo: "philamoca.jpg"
    )
  end

  scenario "an admin can delete a venue" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'
    click_link "Philamoca"
    click_link "Delete Venue"
    expect(page).to have_content("Successfully deleted venue")
    expect(page).to_not have_content("Philamoca")

  end
  scenario "an non-admin cannot delete a venue" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'
    click_link "Philamoca"
    expect(page).to_not have_content("Delete Venue")
  end
end
