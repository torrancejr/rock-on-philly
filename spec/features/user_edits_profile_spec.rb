require 'rails_helper'
require 'pry'


feature "User updates profile" do
  let(:user) do
  User.create(
    first_name: "Meg",
    last_name: "Meg",
    email: "jarlax1@launchacademy.com",
    password: "testtest"
  )
  end
  scenario 'a user can update their current profile' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link "Edit/Delete Profile"
    visit edit_user_registration_path(user)
    fill_in 'First Name', with: "Meaghan"
    fill_in 'Last Name', with: "Conroy"
    fill_in 'Email', with: "jarlax3@launchacademy.com"
    fill_in 'Password', with: "test2test2"
    fill_in 'Password Confirmation', with: "test2test2"
    fill_in 'Current Password', with: "testtest"

    click_button 'Update'
    expect(page).to have_content("Your account has been updated successfully.")


  end

  scenario 'a user incorrectly updates their email' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link "Edit/Delete Profile"
    visit edit_user_registration_path(user)
    fill_in 'Email', with: "jarlaunchacademy.com"
    fill_in 'Password', with: "test2test2"
    fill_in 'Password Confirmation', with: "test2test2"
    fill_in 'Current Password', with: "testtest"

    click_button 'Update'
    expect(page).to have_content('Email is invalid')


  end

  scenario 'a user incorrectly updates their password' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link "Edit/Delete Profile"
    visit edit_user_registration_path(user)
    fill_in 'Password', with: "st2"
    fill_in 'Password Confirmation', with: "st2"
    fill_in 'Current Password', with: "testtest"

    click_button 'Update'
    expect(page).to have_content('Password is too short (minimum is 6 characters)')


  end
end
