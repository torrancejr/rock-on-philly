require 'rest-client'
Venue.destroy_all

response = RestClient.get 'https://api.yelp.com/v3/businesses/search?location=Philadelphia&categories=musicvenues', {:Authorization => ENV['YELP_KEY']}

venues = JSON.parse(response)
venues["businesses"].each do |venue|
  Venue.create!(
    name: venue["name"],
    location: venue["location"]["address1"],
    website: venue["url"],
    photo: venue["image_url"]
  )
end
