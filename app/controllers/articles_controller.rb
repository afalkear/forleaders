class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :owns_article, only: [:edit, :update, :destroy]
  layout 'articles'

  def index
    @featured_articles = Article.includes(:categories).take(4)
    @latest_articles = Article.includes(:categories).last(3)
  end

  def show
    @article = Article.find(params[:id])
    @related_articles =  Article.includes(:categories).where.not(id: @article.id).take(3) # Article.page(params[:page]).per(3)
    @latest_articles = Article.includes(:categories).where.not(id: @article.id).last(3) #Article.page(params[:page]).per(3).order('created_at DESC')
    youtube_url = @article.video_url
    youtube_id = nil
    if !youtube_url.nil?
      if youtube_url[/youtu\.be\/([^\?]*)/]
        youtube_id = $1
      else
        youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
        youtube_id = $5
      end
    end
    @youtube_id = youtube_id
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      # expire cache so related and last articles will be reloaded with this new article
      expire_fragment("latest_articles")
      expire_fragment("#{@article.categories.first.name}-related_articles")
      redirect_to article_path(@article.id)
    else
      flash[:alert] = "Error"
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    expire_fragment(["v1", @article])
    @article.update_attributes(article_params)
    expire_fragment("#{@article.categories.first.name}-related_articles")

    redirect_to article_path(@article.id)
  end

  def destroy
  end

  private
    def article_params
      params.require(:article).permit(
        :title,
        :author,
        :content,
        :tag_id,
        :category_tokens,
        :image_url,
        :article_image,
        :remote_article_image_url,
        :subtitle,
        :hover_frase,
        :excerpt,
        :video_url
        )
    end

    def owns_article
      if !user_signed_in? || current_user != Article.find(params[:id]).user_signed_in
        redirect_to articles_path, error: "You cannot edit an article that is not yours"
      end
    end
end
