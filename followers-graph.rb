#!/user/bin/env ruby
require "rubygems"
require "twitter"
require 'google_chart'

screen_name = String.new ARGV[0]

tweetlocation = Hash.new

Twitter.configure do |config|
  config.consumer           = '<consumer_key>'
  config.consumer_key       = '<consumer_key>'
  config.oauth_token        = '<oath_token>'
  config.oauth_token_secret = '<oath_token_secret>'
end

my_file = File.new("graph.dot", "w")

my_file.puts "graph followers {"
my_file.puts " node [ fontname=Arial, fontsize=6, penwidht=4 ];"

followers = Twitter.follower_ids(screen_name, :cursor=> -1 )

followers.ids[0..[5,followers.ids.length].min].each do |fid|

  f = Twitter.user(fid)

  if (f.protected.to_s != "true")

    my_file.pust " \"" + screen_name + "\" -- \"" + f.screen_name.to_s + "\""

    followers2 = Twitter.follower_ids(f.screen_name, :cursor => -1 )

    followers2.ids[0..[5, followers2.ids.length].min].each do |fid2|

      f2 = Twitter.user(fid2)

      my_file.puts " \"" + f.screen_name.to_s + "\" -- \"" +
        f2.screen_name.to_s + "\""

    end
  end
end

my_file.puts "}"

