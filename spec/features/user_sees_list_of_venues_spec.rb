require 'rails_helper'
# ENZYME TEST CHANGE
xfeature "visitor sees a list of venues" do
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
    expect(page).to have_content venue.website
    expect(page).to have_css("img[src*='uniontransfer.jpg']")
    # expect(page).to have_content "<img src='<%=@venue.photo%>'>"
  end
end
