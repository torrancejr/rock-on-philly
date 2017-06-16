require 'rails_helper'

feature "Admin views a list of users" do
  let!(:admin) do
    FactoryGirl.create(:user, admin: true)
  end
  let!(:user1) do
    FactoryGirl.create(:user)
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
    sign_in_as(admin)
    click_link 'View Users'
    visit admin_users_path
    within("li##{user1.id}") do
      click_link "Delete User"
    end
    expect(page).to have_content("User account deleted")
    visit admin_users_path
  end
end
