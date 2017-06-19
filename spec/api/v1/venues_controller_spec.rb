require "rails_helper"

RSpec.describe Api::V1::VenuesController, type: :controller do
  describe "GET #index" do
      it "should return the list of venues with all capital letters and their ids" do
        venue = Venue.create(name: "Philamoca", location: "123 Street Street", website: "musicymusichere.com", photo: "fjdklsjfkldsjfkdls.com")
        get :index
        expect(json["venues"][0]["name"]).to eq "Philamoca"
        expect(json["venues"][0]["location"]).to eq "123 Street Street"
        expect(json["venues"][0]["website"]).to eq "musicymusichere.com"
        expect(json["venues"][0]["photo"]).to eq "fjdklsjfkldsjfkdls.com"
        expect(json["venues"][0]["id"]).to eq venue.id
      end
    end
end
