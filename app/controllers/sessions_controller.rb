class SessionsController < ApplicationController

  def new
  end

  def create
    session[:is_admin] = params[:is_adm]
    if params[:is_adm]
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
    redirect_to log_in_path
    session[:is_admin] = nil
  end

end
