require 'rails_helper'

RSpec.describe Venue, type: :model do

  it { should have_valid(:name).when("name") }
  it { should_not have_valid(:name).when(nil,'') }

  it { should have_valid(:location).when('123 5th Street') }
  it { should_not have_valid(:location).when(nil,'') }

  it { should have_valid(:ages).when('All') }
  it { should_not have_valid(:ages).when(nil,'') }

  it { should have_valid(:capacity).when(1000) }
  it { should_not have_valid(:capacity).when(nil,'', "eighty") }

  it { should have_valid(:website).when('http://www.utphilly.com/') }
end
