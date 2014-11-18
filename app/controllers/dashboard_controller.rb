class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :can_use_dashboard
  layout "users"

  def articles
    @root_articles = ArticleLanguage.joins(:articles).uniq.order('created_at DESC').page(params[:page]).per(6)
  end

  def authors
    @authors = Author.page(params[:page]).per(6)
  end

  def index
    @user = current_user
  end

  private

  def can_use_dashboard
    if !user_signed_in? || !current_user.role?("author")
      flash[:warning] = "You do not have sufficient privileges to use the dashboard"
      redirect_to user_root_path
    end
  end
end