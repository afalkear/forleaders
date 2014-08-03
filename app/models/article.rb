class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags

  attr_reader :category_tokens, :article_image_cache

  mount_uploader :article_image, ArticleImageUploader

  def self.home_articles
    
  end

  def category_tokens=(tokens)
    self.categories << Category.get_from_tokens(tokens)
  end

  def self.touch
    update_all(updated_at: Time.now)
  end
end
