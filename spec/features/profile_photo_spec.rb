require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"
    fill_in "First Name", with: "Meaghan"
    fill_in "Last Name", with: "Conroy"
    fill_in "Email", with: "ash@s-mart.com"
    fill_in "Password", with: "boomstick!3vilisd3ad"
    fill_in "Password Confirmation", with: "boomstick!3vilisd3ad"
    attach_file "Profile Photo", "#{Rails.root}/spec/fixtures/philamoca.jpg"
    click_button "Sign Up"

    expect(page).to have_content("Welcome! You have signed up successfully")
    expect(page).to have_css("img[src*='philamoca.jpg']")
  end
end
