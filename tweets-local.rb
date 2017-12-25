require "rubygems"
require "twitter"

Twitter.configure do |config|
  config.consumer_key    = '<consumer_key>'
  config.consumer_secret = '<consumer_secret>'
  config.oauth_token     = '<oauth_token>'
  config.oauth_token     = 'oauth_token_secret'
end

screen_name = String.new ARGV[0]

a_user = Twitter.user(screen_name)

if a_user.geo_enabled == true

  long = a_user.status.place.bounding_box.coordinates[0][0][0]
  lat  = a_user.status.place.bounding_box.coordinates[0][0][1]

  Array tweets = Twitter::Search.new.geocode(lat, long, "5mi").fetch

  tweets.each do |t|

    puts t.from_user + " | " + t.text

  end

end

