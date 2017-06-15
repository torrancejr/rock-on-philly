require "rails_helper"

feature "Admin creates a venue" do
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

  scenario "an admin can create a venue" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'
    click_link "Create Venue"
    fill_in 'Name', with: 'Philamoca'
    fill_in 'Location', with: '531 N. 12th Street'
    fill_in 'Ages', with: 'all'
    fill_in 'Capacity', with: 50
    fill_in 'Website', with: "http://www.philamoca.org/"
    fill_in 'Photo', with: "philamoca.jpg"
    click_button 'Add Venue'
    expect(page).to have_content("Successfully created venue")
    expect(page).to have_content("Philamoca")

  end
  scenario "an non-admin cannot create a venue" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'
    expect(page).to_not have_content("Create Venue")
  end
end
