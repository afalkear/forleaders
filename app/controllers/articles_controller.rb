class ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:article][:title]
    @article.author = params[:article][:author]
    @article.image_url = params[:article][:image_url]
    @article.category_id = params[:article][:category_id]
    @article.content = params[:article][:content]
    
    if @article.save
      redirect_to article_path(@article.id)
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
    def article_params
      params.permit(:title, :author, :content, :tag_id, :category_id, :image_url)
    end
end
