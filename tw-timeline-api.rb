require 'twitter'

config = {
  :consumer_key        => '',
  :consumer_secret     => '',
  :access_token        => '',
  :access_token_secret => ''
}

client = Twitter::REST::Client.new(config)
clinet.user_timeline('dkfj').each {|tweet|

  puts tweet.create_at

  puts tweet.text

  puts "retweet num :" + tweet.retweet_count.to_s

  puts "favarite num :" + tweet.favorite_count.to_s

  puts "geo loclation :" + tweet.geo if !tweet.geo.nil?
}

