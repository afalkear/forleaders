class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  attr_reader :category_tokens

  mount_uploader :article_image, ArticleImageUploader


  def category_tokens=(tokens)
    self.categories << Category.get_from_tokens(tokens)
  end
end
