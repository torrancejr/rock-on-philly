require 'rails_helper'

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

  scenario 'an existing user specifies a valid email and password' do
    new_user = user
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: new_user.email
    fill_in 'Password', with: new_user.password
    click_button 'Sign In'
    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')

  end

  scenario 'a nonexistent email and password is supplied' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'nobody@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign In'
    expect(page).to have_content('Invalid Email or password')
    expect(page).to_not have_content('Welcome Back!')
    expect(page).to_not have_content('Sign Out')
  end

  scenario "successful sign out" do
    new_user = user
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: new_user.email
    fill_in 'Password', with: new_user.password
    click_button 'Sign In'
    click_link "Sign Out"

    expect(page).to have_content "You have been signed out"
  end
end
