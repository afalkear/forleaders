class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @featured_articles = Article.page(params[:page]).per(4)
    @latest_articles = Article.page(params[:page]).per(3).order('created_at DESC')
  end

  def show
    @article = Article.find(params[:id])
    @related_articles =  Article.where.not(id: @article.id).take(3) # Article.page(params[:page]).per(3)
    @latest_articles = Article.where.not(id: @article.id).last(3) #Article.page(params[:page]).per(3).order('created_at DESC')
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
    @article = Article.new(article_params)

    if @article.save
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
    @article.update_attributes(article_params)

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
end
