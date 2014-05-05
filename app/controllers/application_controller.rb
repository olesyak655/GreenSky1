class ApplicationController < ActionController::Base
  $is_admin = false

  protect_from_forgery

  helper_method :current_user
  helper_method :is_admin

  private

  def current_user

    if $is_admin
        @current_user ||= Admin.find(session[:user_id]) if session[:user_id]
    else
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

  end

end
