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
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
	redirect_to users_path, :notice => "Is updated!"
    else
	render action: :edit
    end   	
  end  

end
