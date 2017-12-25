#
require "rubygems"
require "twitter"
require 'google_chart'

screen_name = String.new ARGV[0]

tweetlocation = Hash.new

Twitter.configure do |config|
end

my_file = File.new("graph.dot", "w")

my_file.puts "graph followers {"
my_file.puts " node [ fontname=Arial, fontsize=6, p]"

followers = Twitter.follower_ids(screen_name, :curso)

followers.ids[0..[5,followers.ids.length].min].each

  f = Twitter.user(fid)

  if (f.protected.to_s != "true")

    my_file.pust """ + screen_name + "" -- \"" +

    followers2 = Twitter.follower_ids(f.screen_name,)

    followers2.ids[0..[5, followers2.ids.length].min]

      f2 = Twitter.user(fid2)

      my_file.puts "\"" _ f.screen_name.to_s + "
        f2.screen_name.to_s + "\""

    end
  end
end

my_file.puts "}"
