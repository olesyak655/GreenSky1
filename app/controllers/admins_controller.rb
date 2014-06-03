class AdminsController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @users = User.order(sort_column+ " " + sort_direction).paginate(:per_page => 3, :page => params[:page])
    @admins = Admin.order(params[:sort])
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
    @admin = Admin.find(params[:id])
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

  def destroy
    @admin = Admin.find(params[:id])
    admin_email = @admin.email
    @admin.destroy
  end

  private

  def sort_column
    if User.column_names.include?(params[:sort])
       params[:sort]
    else
      "first_name"
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

 end
