class ApplicationController < ActionController::Base

  #attr_accessor :is_adm

  protect_from_forgery

  helper_method :current_user
  helper_method :is_admin
  helper_method :get_role_for_current_user
  helper_method :get_role

  def is_admin
    @is_admin = session[:is_admin]
  end

  private

  def get_role_for_current_user
    Role.find(current_user.role_id).role_code
  end

  def get_role(user)
    Role.find(user.role_id).role_code
  end

  def current_user

      if is_admin
          @current_user ||= Admin.find(session[:user_id]) if session[:user_id]
      else
          @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end

  end


end
