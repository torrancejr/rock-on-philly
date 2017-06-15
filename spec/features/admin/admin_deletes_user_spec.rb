require 'rails_helper'

feature "Admin views a list of users" do
  let(:admin) do
    User.create(
      first_name: "Admin",
      last_name: "Admin",
      email: "jarlax@launchacademy.com",
      password: "testtest",
      admin: true
    )
  end
  let!(:user1) do
    User.create(
      first_name: "Meg",
      last_name: "Conroy",
      email: "jarlax1@launchacademy.com",
      password: "testtest"
    )
  end
  let!(:user2) do
    User.create(
      first_name: "Chris",
      last_name: "Ryan",
      email: "chrisryan@launchacademy.com",
      password: "testtest"
    )
  end
  scenario "an admin can delete a user" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'
    click_link 'View Users'
    visit admin_users_path
    within("li##{user1.id}") do
      click_link "Delete User"
    end
    expect(page).to have_content("User account deleted")
    visit admin_users_path
  end
end
