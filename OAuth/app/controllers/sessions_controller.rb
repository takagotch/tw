class SessionController < ApplicationControllre
  def callback
    auth = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

class SessionController < BaseController
  def callback
    auth = request.env['omniauth.auth']

    session[:user_id] = auth['uid']
    session[:name] = auth['info']['name']

    session[:oauth_token] = auth['credentials']['token']
    session[:oauth_token_secret] = auth['credintials']['secret']

    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end

