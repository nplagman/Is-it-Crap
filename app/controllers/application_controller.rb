class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    # checks for a User based on the session’s user id that was stored when they logged in, and stores result in an instance variable
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # to give access to this method from all the views, the helper_method makes it a helper method
  helper_method :current_user

  include CanCan::ControllerAdditions
  end

