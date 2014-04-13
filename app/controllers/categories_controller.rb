class CategoriesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.name = params[:category][:name]
    if @category.save
      redirect_to category_path(@category.id)
    else
      flash[:alert] = "Error"
      render action: 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
    def category_params
      params.require(:category).permit(:name, :category)
    end
end
