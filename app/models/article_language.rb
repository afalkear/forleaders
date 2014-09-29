class ArticleLanguage < ActiveRecord::Base
  has_many :articles

  def translated_languages
    response = []
    self.articles.each do |article|
      response << article.lang
    end
    response
  end

  def missing_languages
    TranslationCenter::TranslationKey.langs_stats.keys.reject {|l| self.translated_languages.include?(l.to_s)}
  end
end
