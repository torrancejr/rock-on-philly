require 'rails_helper'

# [] Visiting the `/venues` path should contain a list of venues.
# [] Visiting the `/venues/10` path should show the venue details for a venue with the ID of 10.
# [] Visiting the root path should display a list of all venues.

feature "visitor sees a list of venues" do
  scenario "sees a list of venues and link for new venue" do
    philamoca = Venue.create(name: "Philamoca",location: "531 N. 12th Street", ages: "All", capacity: 150, website: "http://www.philamoca.org/", photo: "philamoca.jpg")

    union_transfer = Venue.create(name: "Union Transfer", location: "1026 Spring Garden Street
", ages: "All", capacity: 1000, website: "http://www.utphilly.com/", photo: "uniontransfer.jpg")

    visit venues_path

    expect(page).to have_content philamoca.name
    expect(page).to have_css("img[src*='philamoca.jpg']")
    expect(page).to have_link union_transfer.name
    expect(page).to have_css("img[src*='uniontransfer.jpg']")

  end

  scenario "clicks link and is taken to show page for given venue" do
    philamoca = Venue.create(name: "Philamoca",location: "531 N. 12th Street", ages: "All", capacity: 150, website: "http://www.philamoca.org/", photo: "philamoca.jpg")

    visit root_path

    click_link "Philamoca"

    expect(page).to have_content philamoca.name
    expect(page).to have_content philamoca.location
    expect(page).to have_content philamoca.ages
    expect(page).to have_content philamoca.capacity
    expect(page).to have_content philamoca.website
    expect(page).to have_css("img[src*='philamoca.jpg']")
    # expect(page).to have_content "<img src='<%=@venue.photo%>'>"
  end
end
