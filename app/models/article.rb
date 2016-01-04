class Article < ActiveRecord::Base
  extend FriendlyId
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags
  belongs_to :article_language
  belongs_to :user
  before_save :set_status
  before_validation :set_friendly_url_name
  after_create :update_url_name_to_match_slug

  friendly_id :url_name, :use => [:slugged, :finders, :history]
  validates :url_name, :presence => true

  VALID_STATUSES = %w(draft published)

  attr_reader :category_tokens, :article_image_cache

  mount_uploader :article_image, ImageUploader

  def self.home_articles
  end

  def slug_candidates
    [
      :url_name,
      [:url_name, :lang]
    ]
  end

  def should_generate_new_friendly_id?
    url_name_changed? || super
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

  def set_friendly_url_name
    self.url_name = title if url_name.blank?
  end

  def update_url_name_to_match_slug
    self.update_attribute(:url_name, friendly_id)
  end

  def get_metatag_title
    metatag_title.blank? ? title.capitalize : metatag_title
  end

  def get_metatag_description
    metatag_description.blank? ? excerpt : metatag_description
  end

  def get_metatag_image
    image? ? image.url : "http://www.deroseforleaders.com/assets/logo_derose_method.png"
  end
end
