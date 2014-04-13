class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
  end

  def individual_consultory
  end

  def group_consultory
  end

  def the_method
  end

  def help
  end

  def about
  end

  def contact
  end

  def news
  end
end
