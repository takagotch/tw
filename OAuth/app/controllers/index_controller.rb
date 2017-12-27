require 'oauth'
require 'twitter'

class IndexController < ApplicationController
  CONSUMER_KEY    = "****"
  CONSUMER_SECRET = "*****"

  def self.consumer
    OAuth::Consumer.new(CONSUMER_KEY,
                        CONSUMER_SECRET,
		        {:site => "http:/twitter.com"} )
  end

  def index
  end

  def authorized?
    return session[:oauth_token] && session[oauth_token_secret]
  end

  def tweet
    session[:text] = params[:text]

    if authrized?
      do_tweet
      redirect_to :action =>:index
      return
    end

    request_token = IndexController.consumer.get_request_token(
      :oauth_callback => "http://#{request.host_with_port}/oauth_callback"
    )
    session[:request_token]        = request_token.token
    session[:request_token_secret] = request_token.secret

    redirect_to request_token.authorize_url
  end

  def oauth_callback
    consumer = IndexController.consumer

    request_token = OAuth::RequestToken.new(consumer,
					    session[:request_token],
					    session[:request_token_secret])

    access_token = request_token.get_access_token({},
						  :oauth_token => params[:oauth_token],
						  :oauth_verifier = > params[:oauth_verifier])

    session[:oauth_token]        = access_token.token
    session[:oauth_token_secret] = access_token.secret

    de_tweet
    redirect_to :action=>:index
  end

  def do_tweet
    Twitter.configure do |config|
      config.consumer_key       = CONSUMER_KEY
      config.consumer_secret    = CONSUMER_SECRET
      config.oauth_token        = session[:oauth_token]
      config.oauth_token_secret = session[:oauth_token_secret]
    end

    Twitter.update(session[:text]) if session[:text]
    session[:text] = nil
  end
end

