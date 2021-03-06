class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(params[:user])
   if @user.save
	   redirect_to users_path, :notice => "Signed up!"
   else
	   render action: :new
   end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(params[:id]), :notice => "Is updated!"
    else
	     render action: :edit
    end
  end

  def update_password
    @user = User.find(params[:id])

    if @user == User.authenticate(@user.email, params[:old_password])
      params[:user] = {password: params[:password], password_confirmation: params[:password_confirmation]}
      if @user.update_attributes(params[:user])
         redirect_to user_path(params[:id]), :notice => "Is updated!"
      else
         render action: :edit
      end
    else
      render action: :edit, :notice => "Password is failed! Try again"
    end
  end


  def destroy
    @user = User.find(params[:id])
    user_email = @user.email
    @user.destroy
    redirect_to admins_path, :notice => "User #{user_email} is destroied!"
  end
end
