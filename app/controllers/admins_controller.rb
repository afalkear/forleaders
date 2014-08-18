class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.all #.excludes(:id => current_user.id)
    end
  end

  def new_user
    @user = User.new
  end

  def create_new_user
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
end