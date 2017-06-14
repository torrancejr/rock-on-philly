require 'rails_helper'

RSpec.describe Venue, type: :model do
  it { should have_valid(:name).when('Philamoca', 'Union Transfer') }
  it { should_not have_valid(:name).when(nil,'') }

  it { should have_valid(:location).when('123 5th Street', '456 Penn Street') }
  it { should_not have_valid(:location).when(nil,'') }

  it { should have_valid(:ages).when('All', '21+') }
  it { should_not have_valid(:ages).when(nil,'') }

  it { should have_valid(:capacity).when(500, 1000) }
  it { should_not have_valid(:capacity).when(nil,'', "eighty") }

  it { should have_valid(:website).when('philamoca.com', 'uniontransfer.com') }
end
