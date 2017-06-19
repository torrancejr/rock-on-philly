require "rails_helper"

feature "Admin creates a venue" do
  let!(:admin) do
    FactoryGirl.create(:user, admin: true)
  end
  let!(:user1) do
    FactoryGirl.create(:user)
  end

  scenario "an admin can create a venue" do

    visit root_path
    sign_in_as(admin)
    click_link "Create Venue"
    fill_in 'Name', with: 'Philamoca'
    fill_in 'Location', with: '531 N. 12th Street'
    fill_in 'Website', with: "http://www.philamoca.org/"
    fill_in 'Photo', with: "philamoca.jpg"
    click_button 'Add Venue'
    expect(page).to have_content("Successfully created venue")
    expect(page).to have_content("Philamoca")

  end
  scenario "an non-admin cannot create a venue" do
    visit root_path
    sign_in_as(user1)
    expect(page).to_not have_content("Create Venue")
  end
end
