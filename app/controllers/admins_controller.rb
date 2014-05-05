class AdminsController < ApplicationController

  def index
    @users = User.all
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
   @admin = Admin.new(params[:admin])
   if @admin.save
      redirect_to admins_path, :notice => "Signed up!"
   else
      render action: :new
   end
  end

  def show
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      redirect_to admins_path, :notice => "Is updated!"
    else
      render action: :edit
    end
  end

 end
