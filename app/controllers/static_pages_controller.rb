class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
    @articles_number = 6
    @articles_columns = 3
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
