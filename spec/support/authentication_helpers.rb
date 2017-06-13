module AuthenticationHelper
  def sign_in_as(user)
    visit '/users/log_in'
    click_link "Log in"
    fill_in 'Email', with: 'jarlax1@launchacademy.com'
    fill_in 'Password', with: "testtest"
    click_button 'Log in'
  end

RSpec.configure do |config|
  config.include AuthenticationHelpers, :type => :requests
end
