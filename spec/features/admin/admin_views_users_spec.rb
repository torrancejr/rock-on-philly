require "rails_helper"

feature "Admin views a list of users" do
  let(:admin) do
    User.create(
      first_name: "Admin",
      last_name: "Meg",
      email: "jarlax@launchacademy.com",
      password: "testtest",
      admin: true
    )
  end
  let!(:user1) do
    User.create(
      first_name: "Meg",
      last_name: "Meg",
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
  scenario "an admin can view all users" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'
    click_link 'View Users'
    visit admin_users_path
    expect(page).to have_content("Meg Meg")
    expect(page).to have_content("Chris Ryan")
  end
  scenario "an non-admin cannot view all users" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'
    expect(page).to_not have_content("View Users")
  end
end
