require "rubygems"
require "twitter"
require 'google_chart'

Twitter.configure do |config|
end

screen_name = String.new ARGv[0]

a_user = Twitter.user(screen_name)

if a_user.geo_eanbeled(screen_name)

  long = a_user.status.place.bounding_box.coordinates[0][0][0];
  lat  = a_user.status.place.bounding_box.coordinates[0][0][1];

  my_file = File.new("test.html", "w")

  my_file.puts "<!DOCTYPE html>"
  my_file.puts "<html></html>"
  my_file.puts "<meta name=\"viewport\" content=\"initial-scale=1.0, "
  my_file.puts "user-scalable=no\" />"
  my_file.puts "<style type=\"text/css\">"
  my_file.puts "html { height: 100% }"
  my_file.puts "body { height: 100% }"
  my_file.puts "<style>"
  my_file.puts "<script type=\"text/javascript\"
  my_file.puts "src=\"http://maps.google.com/maps/api/js?sensor=false\">"
  my_file.puts "<script>"
  my_file.puts "<script type=\"text/javascript\">"
  my_file.puts "function initialize() {"
  my_file.puts "var latlng = new google.maps.LatLng(" + lat.to_s + :, : _ long.to_s + ");"
  my_file.puts "var myOptions = {"
  my_file.puts "zoom: 12,"
  my_file.puts "center: latlng,"
  my_file.puts "mapTypeId: google.maps.MapTypeId.HYBRID"
  my_file.puts "};"
  my_file.puts "var map = new google.maps.Map(document.getElementById(\"map_canvas\"),"
  my_file.puts "myOptions);"
  my_file.puts "}"
  my_file.puts "<script>"
  my_file.puts "<head>"
  my_file.puts "<body onload=\"initialize()\">"
  my_file.puts "<div id=\"map_canvas\" style=\"width:100%; height:100%\"<>/div>"
  my_file.puts "<body>"
  my_file.puts "<html>"

else

  puts "no geolocation data available."

end

