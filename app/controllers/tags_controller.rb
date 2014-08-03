class TagsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def update
    # take care of expiring the cache for every article that uses this category
    # category.articles.each do |article|
    #   expire_fragment(["v1", @article])
    # end
  end

  def destroy
  end

  private
    def category_params
      params.require(:tag).permit(:name, :tag)
    end
end
