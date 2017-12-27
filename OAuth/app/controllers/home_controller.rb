class HomeController < BaseContorller
  before_action :login_required, only: [:tweet, :follow, :follow_check]

  def index
  end

  def tweet
    text = sprintf(Settings.tweet_setting.text, Time.now)
    twitter_client.update(text)
    flash[:notice] = "tweet: #{text}"
    redirect_to root_path
  end

  def follow
    twitter_client.follow(Settings.tweet_setting.follow_target_name)
    flash[:notice] = "follow done"
    redirect_to root_path
  end

  def follow_check
    follow_info = twitter_client.friendships(Settings.tweet_setting.follow_target_name).first
    flash[:notice] = "follow check: #{follow_info['connections'].include?('following')}"
    redirect_to root_path
  end

  private
  def twitter_client
    Twitter::Client.new(
      :oauth_token        => @current_user.token,
      :oauth_token_secret => @current_user.secret
    )
  end

end

