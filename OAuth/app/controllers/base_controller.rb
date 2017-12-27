class BaseController < ActionController::Base
  protect_from_forgery
 
  def login_required
    @current_user = current_user
    unless @current_user
      redirect_to root_path
    end

    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      redirect_to root_path
    end

    helper_method :current_user

    private
    def current_user
      @current_user ||= SessionUser.new(session) if session[:user_id]
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
end

