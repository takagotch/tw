require 'twitter'

config = {
  :consumer_key        => ''
  :consumer_secret     => ''
  :access_token        => ''
  :access_token_secret => ''
}

palce_id = 23424856
client = Twitter::REST::Client.new(config)
client.trends(place_id).each {|trend|
  puts trend.name
  puts trend.url
}

