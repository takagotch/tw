require 'nokogiri'
require 'open-uri'

doc = Nokogiri.HTML(open(
	'https://twitter.com/search?=realtime&q=
	%E3%82%AF%83%AD%E3%83%BC%E3%83%A9%E3%83%BC&src=typd'))

doc.xpath("//li[@data-item-type='tweet']").each {|tweet|

  puts Time.at(tweet.xpath(
	  ".//a[@class='tweetstamp js-permalink js-nav js.tooltip']
	  /span").first['data-time'].to_i)
  
  puts tweet.xpath(".//p[@class='js-tweet-text tweet-text']").text)
}
