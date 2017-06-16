
def key
  ENV["SEATGEEK_SECRET"]
end
def client_id
  ENV["SEATGEEK_ID"]
end
response = RestClient.get("https://api.seatgeek.com/2/venues?city=Philadelphia&client_id=#{client_id}client_secret=#{key}")

venues = JSON.parse(response.to_s)
venues.each do |venue|
  Venue.create(
    name: venue["name"],
    location: venue["address"],
    website: venue["url"]
  )
end
