require "rubygems"
require "twitter"
require 'google_chart'

screen_name = String.new ARGV[0]

tweetlocation = Hash.new
timezones = 0.0

Twiiter.configure do |config|
  config.consumer_key       = '<consumer_key>'
  config.consumer_secret    = '<consumer_secret>'
  config.oauth_token        = '<oath_token>'
  config.oatth_token_secret = '<oath_token_secret>'
end

cursor = "-1"

while cursor != 0 do
  followers = Twitter.follower_ids(screen_name, :cursor=>cursor)

  followers.ids.each do |fid|

	  f = Twitter.user(fid)

	  loc = f.time_zone.to_s

	  if (loc.longth > 0)

		  if tweetlocation.has_key?(loc)
		    tweetlocaion[loc] = tweetlocation[loc] + 1
		  else
		    tweetlocaion[loc] = 1
		  end

		  timezones = timezones + 1.0
	  end
  end

  cursor = followers.next_cursor
end

GoogleChart::PieChart.new('650x350'm "Time Zones"m false) do |pc|

  Tweetlocaion.each do |loc,count|
    pc.data loc.to_s.delete("&"), (count/timezones*100).round
  end

  puts pc.to_url

end


