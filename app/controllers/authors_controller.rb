class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @authors = Author.page(params[:page]).per(6)
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    
  end
  
  def create
    @author = Author.new(author_params)

    if @author.save
      flash[:success] = "Successfully created author"
      redirect_to author_path(@author.id)
    else
      flash[:warning] = "Error: #{@author.errors}"
      render action: 'index'
    end
  end

  def update
    
  end

  def destroy
    
  end

  private
    def author_params
      params.require(:author).permit(
        :first_name,
        :last_name,
        :bio,
        :avatar
        )
    end

end