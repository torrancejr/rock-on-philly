require 'rails_helper'
require 'pry'


feature "User signs in" do
  let(:user) do
    User.create(
      # username: "jarlax1",
      first_name: "Meg",
      last_name: "Meg",
      email: "jarlax1@launchacademy.com",
      password: "testtest"
    )
  end

  before :each do
    sign_in_as(user)e
  end

  scenario "successful sign in" do
    visit '/users/sign_in'



    expect(page).to have_content "You're now signed in as #{user.first_name}!"
  end

  scenario "successful sign out" do
    visit '/users/sign_in'
    sign_in_as user
    click_link "Sign Out"

    expect(page).to have_content "You have been signed out"
  end
end
