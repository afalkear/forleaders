class ArticleLanguage < ActiveRecord::Base
  has_many :articles

  def translated_languages
    response = []
    self.articles.each do |article|
      response << article.lang
    end
    response
  end
end
