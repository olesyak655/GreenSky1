class SessionsController < ApplicationController

  def new
  end

  def create
    $is_admin = params[:is_admin]
    if $is_admin
      user = Admin.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to admins_path
      else
        flash.now.alert = "Log in is failed. Invalid e-mail or password"
        render action: :new
      end

    else
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to user_path(session[:user_id])
      else
        flash.now.alert = "Log in is failed. Invalid e-mail or password"
        render action: :new
      end

    end

  end

  def destroy
    session[:user_id] = nil
    $is_admin = false
    redirect_to log_in_path
  end
end
