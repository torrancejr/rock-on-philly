require "rails_helper"

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
  scenario "an admin can view all users" do
    visit root_path
    sign_in_as(admin)
    click_link 'View Users'
    visit admin_users_path
    expect(page).to have_content("ryan torrance")
    expect(page).to have_content("Chris Ryan")
  end
  scenario "an non-admin cannot view all users" do
    visit root_path
    sign_in_as(user1)
    expect(page).to_not have_content("View Users")
  end
end
