class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles
  validates_presence_of :name

  before_save :touch_articles

  def touch_articles
    self.articles.touch
  end
end
