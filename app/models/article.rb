class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags
  belongs_to :article_language
  belongs_to :user
  before_save :set_status

  VALID_STATUSES = %w(draft published)

  attr_reader :category_tokens, :article_image_cache

  mount_uploader :article_image, ImageUploader

  def self.home_articles
  end

  def category
    self.categories.count == 0 ? "" : self.categories.first.name
  end

  def category_tokens=(tokens)
    self.categories << Category.get_from_tokens(tokens)
  end

  def self.touch
    update_all(updated_at: Time.now)
  end

  def image?
    return !self.image.nil?
  end

  def image
    if self.article_image.nil? || self.article_image.url.nil?
      original_article_image
    else
      self.article_image
    end
  end

  def original_article_image
    image = nil
    original = self.article_language
    if !original.nil?
      image = original.articles.first.article_image
    end
    return image
  end

  def set_status
    if self.publish_at.to_date == Date.current
      self.status = "published"
    else
      self.status = "draft"
    end
  end
end
