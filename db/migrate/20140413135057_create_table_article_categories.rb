class CreateTableArticleCategories < ActiveRecord::Migration
  def change
    create_table :articles_categories do |t|
      t.belongs_to :articles
      t.belongs_to :categories
    end
  end
end
