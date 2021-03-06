class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :owns_article, only: [:edit, :update, :destroy]
  layout 'articles'

  def index
    category = params[:category].present? ? params[:category] : ""
    @featured_articles = Article.includes(:categories).where("categories.name LIKE ? AND lang = ? AND publish_at <= ?", "%#{category}%", params[:locale], DateTime.now).references(:categories).take(4)
    @latest_articles = Article.includes(:categories).where("publish_at <= ? AND lang = ?", DateTime.now, params[:locale]).last(3)
  end

  def show
    @article = Article.find(params[:id])
    if request.path != article_path(@article)
      redirect_to @article, status: :moved_permanently
    end
    @related_articles =  Article.includes(:categories).where("categories.name LIKE ? AND lang = ? AND publish_at <= ?", "%#{@article.category}%", params[:locale], DateTime.now).references(:categories).where.not(id: @article.id).take(3) # Article.page(params[:page]).per(3)
    @latest_articles = Article.includes(:categories).where("publish_at <= ? AND lang = ?", DateTime.now, params[:locale]).where.not(id: @article.id).last(3) #Article.page(params[:page]).per(3).order('created_at DESC')
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
    @article_language = params[:article_language] ? ArticleLanguage.find(params[:article_language]) : nil
    @original_article = @article_language.nil? ? nil : @article_language.articles.first
  end

  def create
    @article = current_user.articles.new(article_params)


    if @article.save
      # expire cache so related and last articles will be reloaded with this new article
      expire_fragment("latest_articles")
      expire_fragment("#{@article.categories.first.name}-related_articles")
      expire_page(:controller => "static_pages", :action => "home")


      article_language = params[:article][:article_language] ? ArticleLanguage.find(params[:article][:article_language]) : ArticleLanguage.create
      article_language.articles << @article
      if !params[:article][:article_image] && @article.article_language.articles.count > 1
        #@article.article_image_url = @article.article_language.articles.first.article_image
        @article.save
      end

      flash[:success] = "Successfully created article"
      redirect_to article_path(@article.id)
    else
      flash[:warning] = "Error: #{@article.errors.messages}"
      redirect_to new_article_path(params)
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])


    expire_fragment(["v1", @article])
    response = expire_page(:controller => "static_pages", :action => "home")

    @article.update_attributes(article_params)

    expire_fragment("#{@article.categories.first.name}-related_articles")
    flash[:success] = "Successfully updated article"
    redirect_to article_path(@article.id)
  end

  def destroy
  end

  private
    def article_params
      params.require(:article).permit(
        :title,
        :url_name,
        :author,
        :content,
        :tag_id,
        :category_tokens,
        :image_url,
        :article_image,
        :article_image_cache,
        :remote_article_image_url,
        :subtitle,
        :hover_frase,
        :excerpt,
        :video_url,
        :lang,
        :status,
        :publish_at,
        :metatag_title,
        :metatag_description,
        :category_ids => []
        )
    end

    def owns_article
      return if current_user.admin?
      if !user_signed_in? ||current_user != Article.find(params[:id]).user
        redirect_to articles_path, error: "You cannot edit an article that is not yours"
      end
    end
end
