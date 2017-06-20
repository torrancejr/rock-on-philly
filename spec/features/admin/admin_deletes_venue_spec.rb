require "rails_helper"

feature "Admin deletes a venue" do
  let!(:admin) do
    FactoryGirl.create(:user, admin: true)
  end
  let!(:user1) do
    FactoryGirl.create(:user)
  end
  let!(:venue) do
    FactoryGirl.create(:venue)
  end

  scenario "an admin can delete a venue" do
    visit root_path
    sign_in_as(admin)
    visit venue_path(venue)
    click_link "Delete Venue"
    expect(page).to have_content("Successfully deleted venue")
    expect(page).to_not have_content (venue.name)

  end
  scenario "an non-admin cannot delete a venue" do
    visit root_path
    sign_in_as(user1)
    visit venue_path(venue)
    expect(page).to_not have_content("Delete Venue")
  end
end
