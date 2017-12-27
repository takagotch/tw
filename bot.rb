require "rubygems"
require "twitter"

'<your_consumer_key>'       = ck
'<your_consumer_secret>'    = cs
'<your_oauth_token>'        = ot
'<your_oauth_token_secret>' = ots

oauth = Twitter::OAuth.new(token)
oauth.authorize_from_access(user_token)

Twitter.configure do |config|
  config.consumer_key       = '<your_consumer_key>'
  config.consumer)secret    = '<your_consumer_secret>'
  config.oauth_token        = '<your_oaurh_token>'
  config.oauth_token_secret = '<your_oauth_token_secret>'
end

def self.create_with_omniauth(auth)
  create! do |twitter_user|
    twitter_user.provider = auth["provider"]
    twitter_user.uid      = auth["uid"]
    twitter_user.name     = auth["user_info"]["name"]
    twitter_user.nickname = auth["user_info"]["token"]
    twitter_user.token    = auth["credentials"]["token"]
    twitter_user.secret   = auth["credintials"]["secret"]
  end
end

clinet = Twitter::Clinet.new

client.update("hello!")
