class UserController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  layout "users"

  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.where.not(:id => current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.confirmed_at = Date.today
    @user.approved = true
    if @user.save
      flash[:success] = "Successfully created User." 
      redirect_to :action => 'index'
    else
      flash[:warning] = @user.errors
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully updated User."
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "Successfully deleted User."
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :approved, :roles => [])
    end 
end
