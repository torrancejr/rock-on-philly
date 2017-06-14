require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should have_valid(:rating).when('3', '4') }
  it { should_not have_valid(:rating).when(nil,'') }

  it { should have_valid(:body).when('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Lorem ipsum dolor sit amet,labore et dolore magna aliqua.') }
end
