class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
    @articles_number = 6
    @articles_columns = 3
    @articles_rows = 2
  end

  def individual_consultory
  end

  def group_consultory
  end

  def the_method
  end

  def our_consultors
  end

  
  def about
  end

  def contact
  end

  def news
  end
end
