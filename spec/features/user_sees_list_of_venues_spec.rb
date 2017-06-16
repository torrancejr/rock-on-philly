require 'rails_helper'

# [] Visiting the `/venues` path should contain a list of venues.
# [] Visiting the `/venues/10` path should show the venue details for a venue with the ID of 10.
# [] Visiting the root path should display a list of all venues.

feature "visitor sees a list of venues" do
  scenario "sees a list of venues and link for new venue" do
    venue = FactoryGirl.create(:venue)

    visit venues_path

    expect(page).to have_content venue.name
    expect(page).to have_link venue.name
    expect(page).to have_css("img[src*='uniontransfer.jpg']")

  end

  scenario "clicks link and is taken to show page for given venue" do
     venue = FactoryGirl.create(:venue)

    visit root_path

    click_link venue.name

    expect(page).to have_content venue.name
    expect(page).to have_content venue.location
    expect(page).to have_content venue.ages
    expect(page).to have_content venue.capacity
    expect(page).to have_content venue.website
    expect(page).to have_css("img[src*='uniontransfer.jpg']")
    # expect(page).to have_content "<img src='<%=@venue.photo%>'>"
  end
end
