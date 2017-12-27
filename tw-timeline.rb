require 'nokogiri'
require 'open-uri'

doc = Nokogiri.HTML('https://twitter.com/TwitterJP')
doc.xpath("//div[@data-component-term="tweet"]").each {|tweet|

  puts Time.at(tweet.xpath(
	  ".//a[@class='ProfileTweet-timestamp js-permalink js-nav
	  js-tooltip']/span").first['data-time'].to_i)

  puts tweet.xpath(
  	".//p[@class='ProfileTweet-text js-tweet-text u-dir']").text

  retweet = tweet.xpath(
  	".//p[@class='ProfileTweet-text js-tweet-text u-dir']").text

  retweet = tweet.xpath(
  	".//li[@class='ProfileTweet-action ProfileTweet-action--retweet
	js-toggel-state js-toggele-rt']/button[@class=
	'ProfileTweet-actionCount js-actionCount
	js-tooltip']")
  if !retweet.empty?
    puts "Retweet num: " +
	    retweet[0]['data-tweet-stat-count']
  end

  like = tweet.xpath(
  	".//li[@class='ProfileTweet-action ProfileTweet-action-favorite
	js-toggle-state']/button[@class=
	'ProfileTweet-actionCount js-actionCount js-tooltip']")
  if !like.empty?
    puts "favorite num: " +
	    like[0]['data-tweet-stat-count']
  end
}

