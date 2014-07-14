class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles
  validates_presence_of :name

  before_save :touch_articles

  def self.tokens(query)
    categories = where("name like ?", "%#{query}%")
    if categories.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      categories
    end
  end

  def self.get_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens = tokens.split(',')
    Category.find(tokens)
  end

  def touch_articles
    self.articles.touch
  end
end
