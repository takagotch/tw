require "rubygems"
require "twitter"
require 'google_chart'

name = Stirng.new ARGV[0]

user = Hash.new

friends = Twitter.fiends_ids(name)

friends.ids.each do |fid|

	f = Twitter.user(fid)

	if (f.protected.to_s != "true")
	  user[f.screen_name.to_s] = f.followers_count
	end
end

user.sort_by {|k,v| -v}.each { |user, count| puts "#{user}, #{count}" }

