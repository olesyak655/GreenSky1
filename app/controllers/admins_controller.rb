class AdminsController < ApplicationController

  helper_method :sort_column_users, :sort_direction_users, :sort_column_admins, :sort_direction_admins

  def index
    @users = User.search(params[:search]).order(sort_column_users+ " " + sort_direction_users).paginate(:per_page => 3, :page => params[:page])
    @admins = Admin.order(sort_column_admins+ " " + sort_direction_admins)
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
    if get_role_for_current_user == 2
      params[:admin].merge!(role: get_role_for_current_user)
    end
    if @admin.update_attributes(params[:admin])
      redirect_to admins_path, :notice => "Is updated!"
    else
      render action: :edit
    end
  end

  def update_password
    @admin = Admin.find(params[:id])

    if @admin == Admin.authenticate(@admin.email, params[:old_password])
      params[:admin] = {password: params[:password], password_confirmation: params[:password_confirmation], role: get_role(@admin)}
      if @admin.update_attributes(params[:admin])
         redirect_to admin_path(params[:id]), :notice => "Is updated!"
      else
         render action: :edit
      end
    else
      render action: :edit, :notice => "Password is failed! Try again"
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    admin_email = @admin.email
    @admin.destroy
  end

  private

  def sort_column_users
    if User.column_names.include?(params[:sort_users])
       params[:sort_users]
    else
      "first_name"
    end
  end

  def sort_direction_users
    %w[asc desc].include?(params[:direction_users]) ? params[:direction_users] : "asc"
  end

  def sort_column_admins
    if Admin.column_names.include?(params[:sort_admins])
       params[:sort_admins]
    else
      "first_name"
    end
  end

  def sort_direction_admins
    %w[asc desc].include?(params[:direction_admins]) ? params[:direction_admins] : "asc"
  end
 end
