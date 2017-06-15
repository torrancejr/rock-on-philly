require "rails_helper"

feature "User deletes profile" do
  let(:user) do
    User.create(
      first_name: "Meg",
      last_name: "Meg",
      email: "jarlax1@launchacademy.com",
      password: "testtest"
    )
  end
  scenario "A user can delete their profile" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link 'Edit/Delete Profile'
    visit edit_user_registration_path(user)

    click_button 'Cancel My Account'
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end
end
