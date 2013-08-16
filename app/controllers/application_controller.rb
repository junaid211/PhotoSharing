class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_no_cache

  def check_user_login
    if !session[:user_id].blank?
      redirect_to(:controller=>:users,:action=>:show,:id=>session[:user_id])
    end
  end
  def authenticate_user
    unless session[:user_id]
      redirect_to(:controller => 'sessions', :action => 'new')
      return false
    else
      # set current_user by the current user object
      @current_user = User.find session[:user_id]
      return true
    end
  end
  def authorized_user

  end

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  helper_method :current_user
  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
  end
end
