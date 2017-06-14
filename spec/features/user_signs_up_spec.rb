require 'rails_helper'
require 'pry'


feature "User signs in" do
  scenario 'a new user signs up' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: "Meg"
    fill_in 'Last Name', with: "Meg"
    fill_in 'Email', with: "jarlax1@launchacademy.com"
    fill_in 'Password', with: "testtest"
    fill_in 'Password Confirmation', with: "testtest"

    click_button 'Sign Up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end
end
