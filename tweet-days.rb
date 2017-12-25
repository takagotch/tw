require 'rubygems'
require 'twitter'
require "google_chart"

screen_name = String.new ARGV[0]

dayhash = Hash.new

dayhash = Hash.new

dayhash.default = 0

timeline = Teitter.user_timeline(screen_name, :count => 200 )
timeline.each do |t|
  
  tweetday - t.created_at.to_s[0..2]

  if dayhash.has_key?(tweetday)
    dayhash[tweetday] = dayhash[tweetday] + 1
  else
    dayhash[tweetday] = 1
  end

  GoogleChart::BarChart.new('300x200', screen_name, :vertical, false) do |bc|    
    bc.data "Sunday",    [dayhash["Sun"]], '00000f'
    bc.data "Monday",    [dayhash["Mon"]], '0000ff'
    bc.data "Thesday",   [dayhash["Tue"]], '00ff00'
    bc.data "Wednesday", [dayhash["Wed"]], '00ffff'
    bc.data "Thursday",  [dayhash["Thu"]], 'ff0000'
    bc.data "Friday",    [dayhash["Fri"]], 'ff00ff'
    bc.data "Saturday",  [dayhash["Sat"]], 'ffff00'
    puts bc.to_url

end



